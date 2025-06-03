% rebase('layout.tpl', title='Our Partners', year=year)
% errors     = locals().get('errors', [])
% partners   = locals().get('partners', [])
% form_data  = locals().get('form_data', {})

<div class="scroll-shadow-block">
  <div class="jumbotron useful-header">
    <div class="container">
      <h1>Partner Companies</h1>
      <p class="lead">Meet our trusted business partners</p>
    </div>
  </div>

  <div class="container useful-object-files">

    % if errors:
    <div class="alert alert-danger">
      <ul>
        % for error in errors:
          <li>{{error}}</li>
        % end
      </ul>
    </div>
    % end

    <!-- Блок карточек -->
    <div class="cards-block-scroll">
      <div class="cards-scroll-wrapper">
        <div class="cards-scroll partners">
          % if partners:
            % for entry in partners:
              % company = entry.get('company', {})
              <div class="partner-card">
                <img src="{{company.get('logo_url', '')}}" alt="{{company.get('name', '')}}" />
                <h3>{{company.get('name', '')}}</h3>
                <p>{{company.get('description', '')}}</p>
                <div class="meta">
                  <span><strong>Contact:</strong> {{entry.get('contact_person', '')}}</span>
                  <span><strong>Phone:</strong> {{entry.get('phone', '')}}</span>
                </div>
              </div>
            % end
          % else:
            <p>No partner companies listed.</p>
          % end
        </div>
      </div>
    </div>

    <!-- Форма добавления -->
    <div class="form-card">
      <h2>Add New Partner</h2>
      <form method="post" action="/partners">
        <div class="form-group">
          <label for="contact_person">Contact Person</label>
          <input type="text" id="contact_person" name="contact_person"
                 value="{{form_data.get('contact_person', '')}}"
                 placeholder="Name / Contact Person" required />
        </div>
        <div class="form-group">
          <label for="phone">Phone Number</label>
          <input type="tel" id="phone" name="phone"
                 value="{{form_data.get('phone', '')}}"
                 placeholder="Example: 89161234567 or 71234567890" required />
        </div>
        <div class="form-group">
          <label for="name">Company Name</label>
          <input type="text" id="name" name="name"
                 value="{{form_data.get('name', '')}}"
                 placeholder="Company Name" required />
        </div>
        <div class="form-group">
          <label for="logo_url">Logo URL</label>
          <input type="url" id="logo_url" name="logo_url"
                 value="{{form_data.get('logo_url', '')}}"
                 placeholder="https://..." required />
        </div>
        <div class="form-group full">
          <label for="description">Description</label>
          <textarea id="description" name="description"
                    placeholder="Short description of the company" required>{{form_data.get('description', '')}}</textarea>
        </div>
        <button type="submit" class="btn btn-custom">Add Partner</button>
      </form>
    </div>
  </div>
</div>
