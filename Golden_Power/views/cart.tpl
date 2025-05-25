% rebase('layout.tpl', title='Cart', year=year)

<style id="cart_styles_cart">
    /* cart_styles_cart */
    .jumbotron {
        background: linear-gradient(45deg, #ffd700, #daa520);
        color: white;
        padding: 50px;
        text-align: center;
        border-radius: 10px;
        position: relative;
    }
    .cart-container {
        margin-top: 50px;
    }
    .cart-item {
        display: flex;
        align-items: center;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        padding: 20px;
    }
    .cart-item img {
        width: 150px;
        height: 150px;
        object-fit: contain;
        border-radius: 10px;
        margin-right: 20px;
    }
    .cart-item-details {
        flex: 1;
    }
    .cart-item h3 {
        margin: 0;
        font-size: 1.5rem;
    }
    .cart-item p {
        margin: 5px 0;
        color: #555;
    }
    .cart-item .btn-custom {
        background: linear-gradient(45deg, #ffd700, #daa520);
        color: white;
        border: none;
        transition: 0.3s;
        font-size: 1rem;
        padding: 10px 20px;
        font-weight: bold;
        text-transform: uppercase;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        cursor: pointer;
    }
    .cart-item .btn-custom:hover {
        background: linear-gradient(45deg, #daa520, #ffd700);
        transform: scale(1.05);
        color: black;
    }
    .cart-summary {
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .cart-summary h2 {
        margin-top: 0;
        font-size: 3rem;
    }
    .cart-summary p {
        font-size: 1.7rem;
    }
    .cart-summary .total-price {
        font-weight: bold;
        font-size: 1.5rem;
    }
    .cart-summary .btn-custom {
        background: linear-gradient(45deg, #ffd700, #daa520);
        color: white;
        border: none;
        transition: 0.3s;
        font-size: 1.7rem;
        padding: 15px 40px;
        font-weight: bold;
        text-transform: uppercase;
        border-radius: 10px;
        box-shadow: 0 8px 10px rgba(0, 0, 0, 0.2);
        cursor: pointer;
    }
    .cart-summary .btn-custom:hover {
        background: linear-gradient(45deg, #daa520, #ffd700);
        transform: scale(1.05);
        color: black;
    }
</style>

<div class="jumbotron">
    <div>
        <h1>Your Cart</h1>
    </div>
</div>

<div class="cart-container">
    <div class="cart-item">
        <img src="static/images/Protein.jpg" alt="Optimum Nutrition Protein">
        <div class="cart-item-details">
            <h3>Optimum Nutrition Protein</h3>
            <p>Quantity: 1</p>
            <p>Price: $30.00</p>
        </div>
        <button class="btn-custom">Remove</button>
    </div>

    <div class="cart-item">
        <img src="static/images/yoga_mat.png" alt="Yoga Mat">
        <div class="cart-item-details">
            <h3>Yoga Mat</h3>
            <p>Quantity: 1</p>
            <p>Price: $20.00</p>
        </div>
        <button class="btn-custom">Remove</button>
    </div>

    <div class="cart-item">
        <img src="static/images/kettlebell.jpg" alt="16kg Kettlebell">
        <div class="cart-item-details">
            <h3>16kg Kettlebell</h3>
            <p>Quantity: 1</p>
            <p>Price: $45.00</p>
        </div>
        <button class="btn-custom">Remove</button>
    </div>

    <div class="cart-summary">
        <div class="total-price">
            <h2>Total</h2>
            <p>Total Price: $95.00</p>
        </div>
        <button class="btn-custom">Proceed to Checkout</button>
    </div>
</div>