"""
Routes and views for the bottle application.
"""

from bottle import route, view
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


@route('/reviews')
@view('reviews')
def reviews():
    """Renders the reviews page."""
    return dict(
        title='Reviews',
        message='Information about user reviews.',
        year=datetime.now().year
    )

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