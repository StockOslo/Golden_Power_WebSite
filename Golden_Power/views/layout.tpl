<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - Golden power application</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
    
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
                
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home" style="font-family: Academy Engraved LET; color :gold">Home</a></li>
                    <li><a href="/about" style="font-family: Academy Engraved LET; color :gold">About</a></li>
                    <li><a href="/contact" style="font-family: Academy Engraved LET; color :gold">Contact</a></li>
                    <li><a href="/delivery" style="font-family: Academy Engraved LET; color: gold">Delivery</a></li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/account" style="font-family: Academy Engraved LET; color: gold">Account</a></li>
                    <li><a href="/cart" style="font-family: Academy Engraved LET; color: gold">Cart</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container body-content">
        {{!base}}
        <hr />
        <footer>
            <p>&copy; {{ year }} - OOO Golden Power Team</p>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>

</body>
</html>