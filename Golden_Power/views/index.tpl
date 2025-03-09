% rebase('layout.tpl', title='Home Page', year=year)
    
<style>
        .jumbotron {
            background: linear-gradient(45deg, #ffd700, #daa520);
            color: white;
            padding: 50px;
            text-align: center;
            border-radius: 10px;
            position: relative;
        }
        .btn-custom {
            background: linear-gradient(45deg, #ffd700, #daa520);
            color: white;
            border: none;
            transition: 0.3s;
            font-size: 1.5rem;
            padding: 15px 30px;
            font-weight: bold;
            text-transform: uppercase;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #daa520, #ffd700);
            transform: scale(1.1);
        }
        .product-card {
            text-align: center;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            width: 80%;
            border-radius: 10px;
        }
}
</style>

<div class="jumbotron">
    <div class="mr-4">
        <img src="static/images/Golden_Power.png" style="max-width: 200px; position: absolute; 
top: 5px; left: 10px;">
    </div>
    <div>
        <h1>Sports Goods</h1>
        <p class="lead">The best products for sports and an active lifestyle</p>
        <a href="#products" class="btn btn-custom btn-lg">Buy Now</a>
    </div>
</div>


<div id="products" class="row mt-5">
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/dumbbells.jpg">
            <h3>Sporting goods for the home</h3>
            <p>Fitness gear for your home workouts.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/content/images/sports_belt.jpeg">
            <h3>Sports goods for the gym</h3>
            <p>Professional equipment for gym training.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/sports_nutrition.jpg">
            <h3>Sports nutrition</h3>
            <p>Fuel your workouts with top supplements.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
</div>
