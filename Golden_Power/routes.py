"""
Routes and views for the bottle application.
"""

from bottle import route, view, request, redirect
import json
import os
from datetime import datetime

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/account')
@view('account')
def about():
    """Renders the about page."""
    return dict(
        title='Account',
        message='Your application description page.',
        year=datetime.now().year
    )


REVIEWS_FILE = os.path.join('data', 'reviews.json')


def load_reviews():
    try:
        with open(REVIEWS_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"Error loading reviews: {e}")
        return []


def save_reviews(reviews):
    with open(REVIEWS_FILE, 'w', encoding='utf-8') as f:
        json.dump(reviews, f, ensure_ascii=False, indent=2)


@route('/reviews')
@view('reviews')
def show_reviews():
    """Display the reviews page."""
    reviews = load_reviews()
    return dict(
        title='Reviews',
        message='Information about user reviews.',
        reviews=reviews,
        year=datetime.now().year
    )


@route('/add', method='POST')
def add_review():
    """Handle form submission to add a new review."""
    author = request.forms.get('author')
    phone = request.forms.get('phone')
    date = request.forms.get('date')
    text = request.forms.get('text')

    if not (author and phone and date and text):
        return "Missing field(s)", 400

    new_review = {
        'author': author,
        'phone': phone,
        'date': date,
        'text': text
    }

    reviews = load_reviews()
    reviews.append(new_review)
    save_reviews(reviews)

    redirect('/reviews')

@route('/cart')
@view('cart')
def cart():
    """Renders the cart page."""
    return dict(
        title='Cart',
        message='Your shopping cart.',
        year=datetime.now().year
    )

@route('/articles')
@view('articles')
def cart():
    """Renders the cart page."""
    return dict(
        title='Articles',
        message='Our list of articles',
        year=datetime.now().year
    )

@route('/useful_articles')
@view('useful_articles')
def useful_articles():
    """Renders the useful articles page."""
    import json, os
    file_path = os.path.join('static', 'storage_articles.json')
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            articles = json.load(f)
    except Exception as e:
        articles = []
        print(f"Ошибка загрузки статей: {e}")
    return dict(
        title='Articles',
        message='Our list of articles',
        articles=articles,
        errors=[],
        year=datetime.now().year
    )