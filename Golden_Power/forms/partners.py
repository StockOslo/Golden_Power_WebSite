from bottle import route, post, view, request, redirect
import json, re
from datetime import datetime
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
PARTNERS_FILE = PROJECT_ROOT / 'static' / 'json_storage' / 'storage_partners.json'

URL_RE = re.compile(
    r'^(https?://)'
    r'(([A-Za-z0-9-]+\.)+[A-Za-z]{2,}|localhost|(\d{1,3}\.){3}\d{1,3})'
    r'(:\d+)?(/.*)?$'
)

IMAGE_EXT_RE = re.compile(r'.*\.(png|jpg|jpeg|svg|webp)$', re.IGNORECASE)
NAME_RE = re.compile(r"^[A-Za-zА-Яа-яЁё\s\-]{4,100}$")  # 4-100 chars letters, spaces, dashes

def is_valid_url(url):
    return bool(URL_RE.match(url))

def load_partners():
    if not PARTNERS_FILE.exists():
        return []
    with open(PARTNERS_FILE, 'r', encoding='utf-8') as f:
        return json.load(f)

def save_partner(entry):
    data = load_partners()
    data.append(entry)
    with open(PARTNERS_FILE, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

@route('/partners')
@view('partners')
def partners_view():
    return dict(
        partners=sorted(load_partners(), key=lambda x: x['created_at'], reverse=True),
        errors=[],
        form_data={},
        year=datetime.now().year
    )

@post('/partners')
@view('partners')
def add_partner():
    contact_person = request.forms.get('contact_person', '').strip()
    phone = request.forms.get('phone', '').strip()
    name = request.forms.get('name', '').strip()
    logo_url = request.forms.get('logo_url', '').strip()
    description = request.forms.get('description', '').strip()

    errors = []
    form_data = {
        'contact_person': contact_person,
        'phone': phone,
        'name': name,
        'logo_url': logo_url,
        'description': description
    }

    # Contact Person validation
    if not contact_person or not NAME_RE.fullmatch(contact_person):
        errors.append("Contact name must be 4–100 characters and contain only letters, spaces or dashes.")

    # Phone validation (exactly 11 digits, starts with 7 or 8)
    digits = re.sub(r'\D', '', phone)
    if len(digits) != 11 or not digits.startswith(('7', '8')):
        errors.append("Phone must contain exactly 11 digits and start with 7 or 8.")

    # Company Name validation
    if not name or len(name) < 2 or len(name) > 150:
        errors.append("Company name must be 2–150 characters.")

    # Logo URL validation
    if not logo_url or len(logo_url) > 2048:
        errors.append("Logo URL is too long.")
    elif not is_valid_url(logo_url):
        errors.append("Logo must be a valid URL (http or https).")
    elif not IMAGE_EXT_RE.match(logo_url):
        errors.append("Logo URL must end with .png, .jpg, .jpeg, .svg or .webp.")

    # Description validation (at least 10 non-space characters, max 1000)
    desc_no_space = re.sub(r'\s+', '', description)
    if not description or len(desc_no_space) < 10:
        errors.append("Description must be at least 10 characters (excluding spaces).")
    elif len(description) > 1000:
        errors.append("Description cannot exceed 1000 characters.")

    if errors:
        # Возврат формы с ошибками и сохранением введённых данных
        return dict(
            partners=sorted(load_partners(), key=lambda x: x['created_at'], reverse=True),
            errors=errors,
            form_data=form_data,
            year=datetime.now().year
        )

    # Если валидация успешна — сохраняем и делаем редирект
    new_entry = {
        "contact_person": contact_person,
        "phone": phone,
        "created_at": datetime.now().isoformat(),
        "company": {
            "name": name,
            "logo_url": logo_url,
            "description": description
        }
    }
    save_partner(new_entry)
    return redirect('/partners')
