from bottle import route, view, request, redirect
import json
import re
from datetime import datetime
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
REVIEWS_FILE = PROJECT_ROOT / 'static' / 'json_storage' / 'storage_reviews.json'

def load_reviews():
    try:
        with open(REVIEWS_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"[ERROR] Can't load reviews: {e}")
        return []

def save_reviews(reviews):
    try:
        with open(REVIEWS_FILE, 'w', encoding='utf-8') as f:
            json.dump(reviews, f, ensure_ascii=False, indent=2)
    except Exception as e:
        print(f"[ERROR] Can't save reviews: {e}")

@route('/reviews')
@view('reviews')
def show_reviews():
    reviews = load_reviews()
    reviews = list(reversed(reviews))
    return dict(
        title='Reviews',
        message='Information about user reviews.',
        reviews=reviews,
        year=datetime.now().year,
        error=None
    )

@route('/add', method='POST')
@view('reviews')
def add_review():
    author = request.forms.get('author', '').strip()
    email = request.forms.get('email', '').strip()
    text = request.forms.get('text', '').strip()

    reviews = load_reviews()
    error = None

    email_regex = r'^[\w\.-]+@[\w\.-]+\.\w{2,64}$'
    name_regex = r'^[A-Za-z\s\-]{2,151}$'
    text_regex = r'(.*[A-Za-z].*){2,}'

    if not (author and email and text):
        error = "All fields are required."
    elif not re.match(name_regex, author):
        error = "Name must contain only English letters, spaces or dashes and be at least 2 characters."
    elif not re.match(email_regex, email):
        error = "Invalid email address."
    elif not re.search(text_regex, text):
        error = "Comment must contain at least two English letters."
    elif any(r.get('email', '').strip().lower() == email.lower() for r in reviews):
        error = "You have already submitted a review with this email."

    if error:
        return dict(
            title='Reviews',
            message='Information about user reviews.',
            reviews=list(reversed(reviews)),
            year=datetime.now().year,
            error=error
        )

    new_review = {
        'author': author,
        'email': email,
        'date': datetime.now().strftime('%Y-%m-%d'),
        'text': text
    }

    reviews.append(new_review)
    save_reviews(reviews)

    redirect('/reviews')

def add_review_TEST(return_dict=False):
    author = request.forms.get('author', '').strip()
    email = request.forms.get('email', '').strip()
    text = request.forms.get('text', '').strip()

    error = None

    reviews_list = load_reviews()

    email_regex = r'^[\w\.-]+@[\w\.-]+\.\w{2,64}$'
    name_regex = r'^[A-Za-z\s\-]{2,50}$'
    text_regex = r'(.*[A-Za-z].*){2,151}'

    if not all([author, email, text]):
        error = 'All fields are required.'
    elif not re.match(name_regex, author):
        error = "Name must contain only English letters, spaces or dashes and be at least 2 characters."
    elif not re.match(email_regex, email):
        error = 'Invalid email address.'
    elif not re.search(text_regex, text):
        error = 'Comment must contain at least two English letters.'
    elif any(r.get('email', '').strip().lower() == email.lower() for r in reviews_list):
        error = 'You have already submitted a review with this email.'

    if any(r.get('email', '').strip().lower() == email.lower() for r in reviews_list):
        error = 'You have already submitted a review with this email.'

    if error:
        return {'error': error}

    new_review = {
        'author': author,
        'email': email,
        'date': datetime.now().strftime('%Y-%m-%d'),
        'text': text
    }

    reviews_list.append(new_review)
    save_reviews(reviews_list)

    if return_dict:
        return {'success': True}

    redirect('/reviews')
