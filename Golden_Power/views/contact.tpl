<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - Golden Power Application</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
    <style>
        .contact-section {
            background: linear-gradient(45deg, #ffd700, #daa520);
            color: white;
            padding: 50px;
            text-align: center;
            border-radius: 10px;
            margin-top: 20px;
        }

        .contact-info {
            text-align: left;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: black;
            margin-top: 20px;
        }

        .contact-info a {
            color: #daa520;
            text-decoration: none;
            transition: color 0.3s;
        }

        .contact-info a:hover {
            color: #ffd700;
        }

        .social-icons {
            margin-top: 20px;
        }

        .social-icons img {
            width: 30px;
            height: 30px;
            margin: 0 10px;
            transition: transform 0.3s;
        }

        .social-icons img:hover {
            transform: scale(1.1);
        }

        .contact-form {
            margin-top: 30px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact-form button {
            background: linear-gradient(45deg, #ffd700, #daa520);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            font-size: 16px;
        }

        .contact-form button:hover {
            background: linear-gradient(45deg, #daa520, #ffd700);
        }

        .navbar-inverse {
            background-color: black;
        }

        .navbar-nav > li > a {
            color: white;
        }

        .navbar-nav > li > a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="static/images/Erick.png" alt="Logo"> 
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home">Home</a></li>
                    <li><a href="/about">About</a></li>
                    <li><a href="/contact">Contact</a></li>
                    <li><a href="/delivery">Delivery</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/account">Account</a></li>
                    <li><a href="/cart">Cart</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container body-content">
        <div class="contact-section">
            <h2>{{ title }}</h2>
            <h3>We are glad to see you! 📞</h3>
            <p>You can contact us through the following channels:</p>
        </div>

        <div class="contact-info">
            <address>
                123 Sports Lane<br />
                Fitness City, CA 90210<br />
                <abbr title="Phone">P:</abbr> (555) 123-4567
            </address>

            <address>
                <strong>Support:</strong> <a href="mailto:support@goldenpower.com">support@goldenpower.com</a><br />
                <strong>Marketing:</strong> <a href="mailto:marketing@goldenpower.com">marketing@goldenpower.com</a>
            </address>

            <div class="social-icons">
                <a href="https://vk.com/club229696341"><img src="static/images/VK.png" alt="VK"></a>
                <a href="https://t.me/+fg7tlOzSD6c1ZDcy"><img src="static/images/telegram.png" alt="Telegram"></a>
                <a href="https://www.instagram.com"><img src="static/images/instagram.jpg" alt="Instagram"></a>
            </div>
        </div>

        <div class="contact-form">
            <h3>Contact Us</h3>
            <form action="C:\Users\Карина\source\repos\Golden_Power_WebSite\Golden_Power\views\your_email_script.php" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
                <button type="submit">Send</button>
            </form>
        </div>

        <hr />
        <footer>
            <p>&copy; {{ year }} - Golden Power Application</p>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>
</body>
</html>
