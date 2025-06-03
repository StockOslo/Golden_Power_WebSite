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
        font-size: 1.2rem;
        padding: 10px 20px;
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
        width: 100%;
        height: 200px;
        object-fit: contain; 
        border-radius: 10px;
    }
    .section-title {
        font-weight: bold;
        font-size: 4rem;
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
            <img src="static/images/Sports_accessories.jpg">
            <h3>Sports accessories</h3>
            <p>Fitness accessories for home and gym workouts.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/Sports_equipment.jpeg">
            <h3>Sports equipment</h3>
            <p>Professional equipment for gym training.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/Sports_nutrition.jpg">
            <h3>Sports nutrition</h3>
            <p>Fuel your workouts with top supplements.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
</div>

<h2 class="section-title">Products of the Month</h2>
<div class="row mt-5">
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/Protein.jpg">
            <h3>Optimum Nutrition Protein</h3>
            <p>The best choice for muscle gain.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/yoga_mat.png">
            <h3>Yoga Mat</h3>
            <p>Perfect mat for yoga and fitness.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/kettlebell.jpg">
            <h3>16kg Kettlebell</h3>
            <p>Essential gear for strength training.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
</div>

<h2 class="section-title">Deals of the Month</h2>
<div class="promo-banner">
    20% OFF all sports equipment! Limited time offer!
</div>

<div class="row mt-5">
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/Boxing_gloves.jpg">
            <h3>Boxing Gloves</h3>
            <p>15% off on professional boxing gloves.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/Sneakers.jpg">
            <h3>Running Shoes</h3>
            <p>Special price on high-performance running shoes.</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
    <div class="col-md-4">
        <div class="product-card">
            <img src="static/images/Energy_drink.png">
            <h3>Energy Drink</h3>
            <p>Buy 2, get 1 free!</p>
            <button class="btn btn-custom">Buy</button>
        </div>
    </div>
</div>