% rebase('layout.tpl', title=title, year=year)


<style>
    .jumbotron {
        background: linear-gradient(45deg, #ffd700, #daa520);
        color: white;
        padding: 70px 50px;
        text-align: center;
        border-radius: 10px;
        position: relative;
    }


    .jumbotron .lead {
        font-size: 1.8rem;
        margin-bottom: 30px;
    }

    .contact-section {
        background: #f8f9fa;
        color: #343a40;
        padding: 70px 50px;
        text-align: center;
        border-radius: 10px;
        margin-top: 50px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .contact-section h2 {
        font-size: 3.5rem;
        margin-bottom: 40px;
    }

    .contact-info {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
        margin-top: 30px;
    }

    .contact-info address {
        background: white;
        color: #343a40;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .contact-info address:hover {
        transform: scale(1.05);
    }

    .contact-info address p {
        font-size: 1.4rem;
        line-height: 1.5;
        margin: 10px 0;
    }

    .contact-info address a {
        color: #343a40;
        text-decoration: none;
        transition: color 0.3s;
    }

    .contact-info address a:hover {
        color: #ffd700;
    }

    .social-icons {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 30px;
    }

    .social-icons img {
        width: 50px;
        height: 50px;
        transition: transform 0.3s;
    }

    .social-icons img:hover {
        transform: scale(1.1);
    }

    .contact-form {
        background: white;
        color: #343a40;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        margin-top: 50px;
    }

    .contact-form h3 {
        font-size: 2.5rem;
        margin-bottom: 30px;
        text-align: center;
    }

    .contact-form input,
    .contact-form textarea {
        width: 100%;
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1.4rem;
    }

    .contact-form button {
        background: linear-gradient(45deg, #ffd700, #daa520);
        color: white;
        border: none;
        padding: 15px 30px;
        font-size: 1.5rem;
        font-weight: bold;
        text-transform: uppercase;
        border-radius: 5px;
        cursor: pointer;
        transition: transform 0.3s;
    }

    .contact-form button:hover {
        transform: scale(1.05);
    }
</style>

<div class="jumbotron">
    <div>
        <h1>Contact Us</h1>
        <p class="lead">We are here to help you! Reach out to us anytime.</p>
    </div>
</div>

<div class="contact-section">
    <h2>Our Contacts</h2>
    <div class="contact-info">
        <address>
            <strong>Address:</strong><br>
            123 Sports Street<br>
            Fitness City, California 90210<br>
            <abbr title="Phone">Phone:</abbr> (555) 123-4567
        </address>
        <address>
            <strong>Email:</strong><br>
            <a href="mailto:support@goldenpower.com">support@goldenpower.com</a><br>
            <a href="mailto:marketing@goldenpower.com">marketing@goldenpower.com</a>
        </address>
    </div>

    <div class="social-icons">
        <a href="https://vk.com/club229696341"><img src="static/images/VK.png" alt="VK"></a>
        <a href="https://t.me/+fg7tlOzSD6c1ZDcy"><img src="static/images/telegram.png" alt="Telegram"></a>
       
    </div>
</div>

<div class="contact-form">
    <h3>Send Us a Message</h3>
    <form action="#" method="POST">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
        <button type="submit">Send</button>
    </form>
</div> 