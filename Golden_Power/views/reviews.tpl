% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/static/style.css" />
</head>
<body>

    <div class="jumbotron">
        <div>
            <h1>Customer Reviews</h1>
            <p class="lead">What our customers are saying about us</p>
        </div>
    </div>

  <div class="scroll-shadow-block">
    <section class="add-form-section">
      <h2>Add a Review</h2>
      <form action="/add" method="post" class="form-card" novalidate>

        <div class="form-row form-row-vertical">
          <div class="form-group">
            <input
              type="text"
              name="author"
              placeholder="Your name or nickname"
              required
              autocomplete="name"
              pattern="^[A-Za-z\s\-]{2,}$"
              title="Only English letters, spaces or dashes. At least 2 characters."
            />
          </div>

          <div class="form-group">
            <input
              type="tel"
              name="phone"
              placeholder="Phone"
              required
              pattern="^\+[\d\s\-]{10,15}$"
              title="Phone must start with '+' and contain 10 to 15 digits."
              autocomplete="tel"
            />
          </div>
        </div>

        <div class="form-row form-row-vertical">
          <div class="form-group">
            <input
              type="email"
              name="email"
              placeholder="Your email address"
              required
              autocomplete="email"
            />
          </div>
          <div class="form-group full">
            <textarea
              name="text"
              placeholder="Your review..."
              required
              rows="5"
              maxlength="150"
              title="Message must not contain Cyrillic characters."
            ></textarea>
          </div>
        </div>

        % if error:
          <div class="error-message">{{ error }}</div>
        % end

        <button type="submit" class="btn-custom">Submit</button>
      </form>
    </section>

    <section class="cards-section">
      <div class="cards-scroll-reviews">
        % for r in reviews:
          <article class="object-file-card-reviews">
            <h3>{{ r['author'] }}</h3>
            <p class="object-file-text">{{ r['text'] }}</p>
            <div class="meta">
              <time datetime="{{ r['date'] }}">{{ r['date'] }}</time> |
              <span class="email">{{ r.get('email', '') }}</span>
            </div>
          </article>
        % end
      </div>
    </section>

  </div>

</body>
</html>
