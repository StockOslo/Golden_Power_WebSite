"""
This script runs the application using a development server.
"""

import bottle
import os
import sys
import routes
from forms import useful_articles
# Импортируем обработчики маршрутов

# Включаем режим отладки, если нужно
if '--debug' in sys.argv[1:] or 'SERVER_DEBUG' in os.environ:
    bottle.debug(True)

# Указываем путь к шаблонам
from bottle import TEMPLATE_PATH
PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
TEMPLATE_PATH.insert(0, os.path.join(PROJECT_ROOT, 'views'))  # Папка с шаблонами

# Указываем папку со статическими файлами
STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static')

@bottle.route('/static/<filepath:path>')
def server_static(filepath):
    """Обработчик для статических файлов."""
    return bottle.static_file(filepath, root=STATIC_ROOT)

if __name__ == '__main__':
    HOST = os.environ.get('SERVER_HOST', 'localhost')
    try:
        PORT = int(os.environ.get('SERVER_PORT', '8080'))  # Используем порт 8080
    except ValueError:
        PORT = 8080

    # Запускаем сервер с автообновлением кода
    bottle.run(host=HOST, port=PORT, debug=True, reloader=True)