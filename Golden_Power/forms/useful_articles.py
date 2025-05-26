from bottle import route, view, post, request, redirect
import json
import os
import re
from datetime import date, datetime
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
ARTICLES_FILE = PROJECT_ROOT / 'static' / 'json_storage' / 'storage_articles.json'

# Регулярные выражения для проверки email и URL
EMAIL_RE = re.compile(
    r"^(?!\.)[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*"
    r"@"
    r"(?:[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?\.)+"
    r"[A-Za-z]{2,63}$"
)
URL_RE = re.compile(
    r'^(https?://)'
    r'(([A-Za-z0-9-]+\.)+[A-Za-z]{2,6}|'
    r'localhost|'
    r'(\d{1,3}\.){3}\d{1,3})'
    r'(:\d+)?'
    r'(/.*)?$'
)

# Проверка корректности email
def is_valid_email(email):
    m = EMAIL_RE.match(email)
    if not m:
        return False
    local, domain = email.split('@', 1)
    if len(local) > 64 or len(domain) > 255 or len(email) > 254:
        return False
    return True

# Проверка корректности URL
def is_valid_url(url):
    return bool(URL_RE.match(url))

# Загрузка статей из JSON-файла
def load_articles():
    """Загружает все статьи."""
    if not os.path.exists(ARTICLES_FILE):
        return []
    try:
        with open(ARTICLES_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception:
        return []

# Сохранение новой статьи в JSON-файл
def save_article(new_entry):
    """Добавляет статью для email, если автор совпадает или этот email новый."""
    articles = load_articles()
    articles.append(new_entry)
    with open(ARTICLES_FILE, 'w', encoding='utf-8') as f:
        json.dump(articles, f, ensure_ascii=False, indent=4)

# Отображение списка статей
@route('/useful_articles')
@view('useful_articles')
def show_articles():
    articles = sorted(
        load_articles(),
        key=lambda x: x['created_at'],
        reverse=True
    )
    return dict(articles=articles, errors=[], year=datetime.now().year)

# Добавление новой статьи с валидацией данных
@post('/useful_articles')
@view('useful_articles')
def add_article():
    errors = []
    author = request.forms.get('author', '').strip()
    email = request.forms.get('email', '').strip()
    title = request.forms.get('title', '').strip()
    image_url = request.forms.get('image_url', '').strip()
    article_link = request.forms.get('article_link', '').strip()
    description = request.forms.get('description', '').strip()
    created_at = str(date.today())

    # Валидация
    if not author or len(author) < 4:
        errors.append("Author name is required and must be at least 4 characters.")
    if not email or not is_valid_email(email):
        errors.append("Valid email is required.")
    if not title or len(title) < 4:
        errors.append("Article title is required and must be at least 4 characters.")
    if not image_url or not is_valid_url(image_url):
        errors.append("Valid image URL is required.")
    if not article_link or not is_valid_url(article_link):
        errors.append("Valid article link is required.")
    desc_no_space = re.sub(r'\s+', '', description)
    if not description or len(desc_no_space) < 10:
        errors.append("Description must be at least 10 characters (excluding spaces).")

    # НОВАЯ ПРОВЕРКА: email занят другим автором
    articles = load_articles()
    for entry in articles:
        if entry['email'].lower() == email.lower() and entry['author'] != author:
            return redirect('/useful_articles?email_error=1')

    if errors:
        return dict(articles=articles, errors=errors, year=datetime.now().year)

    new_entry = {
        "author": author,
        "email": email,
        "created_at": created_at,
        "article": {
            "title": title,
            "image_url": image_url,
            "link": article_link,
            "description": description
        }
    }
    save_article(new_entry)
    return dict(articles=load_articles(), errors=[], year=datetime.now().year)


# Валидация данных статьи для unit-тестирования
def validate_article_form(author, email, title, image_url, article_link, description):
    """Валидация данных статьи. Возвращает список ошибок."""
    errors = []
    if not author or len(author) < 4:
        errors.append("Author name is required and must be at least 4 characters.")
    if not email or not is_valid_email(email):
        errors.append("Valid email is required.")
    if not title or len(title) < 4:
        errors.append("Article title is required and must be at least 4 characters.")
    if not image_url or not is_valid_url(image_url):
        errors.append("Valid image URL is required.")
    if not article_link or not is_valid_url(article_link):
        errors.append("Valid article link is required.")
    desc_no_space = re.sub(r'\s+', '', description)
    if not description or len(desc_no_space) < 10:
        errors.append("Description must be at least 10 characters (excluding spaces).")
    return errors