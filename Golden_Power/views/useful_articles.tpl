% rebase('layout.tpl', title='Useful Object Files', year=year)
% errors   = locals().get('errors', [])
% articles = locals().get('articles', [])




<style>

input#article_link, textarea#description {
  min-width: 350px;
  max-width: 650px;
  width: 100%;
  margin-left: 0;
  margin-right: 0;
  /* removed height and font-size as per instructions */
}
</style>

<div class="scroll-shadow-block">
  <!-- 1) Шапка с заголовком и фотками -->
  <div class="jumbotron useful-header">
    <div class="container">
      <h1>Useful Articles</h1>
      <p class="lead">The most interesting and useful content for you</p>
    </div>
  </div>

  <div class="container useful-object-files">

    <!-- 3) Ряд карточек статей с прокруткой -->
    <div class="cards-scroll">
      % if articles:
        % for article_entry in articles:
          % article = article_entry.get('article', {})
          <a href="{{article.get('link', '#')}}" class="object-file-card">
            <img src="{{article.get('image_url', '')}}" alt="{{article.get('title', '')}}" class="card-image" />
            <h3>{{article.get('title', '')}}</h3>
            <p class="object-file-text">{{article.get('description', '')}}</p>
            <div class="meta">
              <span class="author">{{article_entry.get('author', '')}}</span>
              <span class="date">{{article_entry.get('created_at', '')}}</span>
            </div>
          </a>
        % end
      % else:
        <p>No articles available.</p>
      % end
    </div>

    <!-- 4) Форма добавления -->
    <div class="form-card">
      <h2>Add Object File</h2>
      <form method="post" action="/useful_articles">
        <div class="form-group">
          <label for="author">Author</label>
          <input type="text" id="author" name="author" placeholder="Author's full name" required />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="author@email.com" required />
        </div>
        <div class="form-group">
          <label for="title">Title</label>
          <input type="text" id="title" name="title" placeholder="Title of the object file" required />
        </div>
        <div class="form-group">
          <label for="image_url">Image URL</label>
          <input type="url" id="image_url" name="image_url" placeholder="https://..." required />
        </div>
        <div class="form-group">
          <label for="article_link">Article Link</label>
          <input type="url" id="article_link" name="article_link" placeholder="https://example.com/object_file" required />
        </div>
        <div class="form-group full">
          <label for="description">Description</label>
          <textarea id="description" name="description" required placeholder="Short description about the object file"></textarea>
        </div>
        <button type="submit" class="btn btn-custom">Submit</button>
      </form>
    </div>
  </div>
</div>
