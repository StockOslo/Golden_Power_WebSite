
document.addEventListener("DOMContentLoaded", function () {
  // Кешируем элементы формы
  const form = document.querySelector('.form-card form');
  const author = form.querySelector('[name="author"]');
  const email = form.querySelector('[name="email"]');
  const title = form.querySelector('[name="title"]');
  const image_url = form.querySelector('[name="image_url"]');
  const article_link = form.querySelector('[name="article_link"]');
  const description = form.querySelector('[name="description"]');
  const submitBtn = form.querySelector('button[type="submit"]');

  // Создаём error div для каждого поля
  [author, email, title, image_url, article_link, description].forEach(input => {
    let errorDiv = document.createElement('div');
    errorDiv.className = 'input-error';
    errorDiv.style.color = 'crimson';
    errorDiv.style.fontSize = '0.9em';
    errorDiv.style.marginTop = '2px';
    input.insertAdjacentElement('afterend', errorDiv);
  });

  // Валидация по правилам из сервера
  function validateAuthor() {
    let val = author.value.trim();
    if (val.length < 4) return "Name must be at least 4 characters.";
    return "";
  }
  function validateEmail() {
    let val = email.value.trim();
    if (!/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i.test(val)) return "Valid email required.";
    return "";
  }
  function validateTitle() {
    let val = title.value.trim();
    if (val.length < 4) return "Title must be at least 4 characters.";
    return "";
  }
  function validateImageURL() {
    let val = image_url.value.trim();
    if (!/^https?:\/\/.+/i.test(val)) return "Valid image URL required.";
    return "";
  }
  function validateArticleLink() {
    let val = article_link.value.trim();
    if (!/^https?:\/\/.+/i.test(val)) return "Valid article link required.";
    return "";
  }
  function validateDescription() {
    let val = description.value.trim();
    let valNoSpaces = val.replace(/\s+/g, "");
    if (valNoSpaces.length < 10) return "Description must be at least 10 characters (excluding spaces).";
    return "";
  }

  function showError(input, msg) {
    input.nextElementSibling.textContent = msg;
  }

  function validateAll() {
    let valid = true;
    const validators = [
      [author, validateAuthor],
      [email, validateEmail],
      [title, validateTitle],
      [image_url, validateImageURL],
      [article_link, validateArticleLink],
      [description, validateDescription]
    ];
    for (let [input, validate] of validators) {
      let err = validate();
      showError(input, err);
      if (err) valid = false;
    }
    submitBtn.disabled = !valid;
    return valid;
  }

  // Вешаем события на "input" и "blur" для всех полей
  [author, email, title, image_url, article_link, description].forEach(input => {
    input.addEventListener('input', validateAll);
    input.addEventListener('blur', validateAll);
  });

  // Проверяем в самом начале, если вдруг автозаполнено
  validateAll();
});
