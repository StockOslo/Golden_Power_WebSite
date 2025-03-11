% rebase('layout.tpl', title='Customer Reviews', year=year)

<style>
    .jumbotron {
        background: linear-gradient(45deg, #ffd700, #daa520);
        color: white;
        padding: 70px 50px;
        text-align: center;
        border-radius: 10px;
        position: relative;
    }

    .jumbotron h1 {
        font-size: 3.5rem;
        margin-bottom: 20px;
    }

    .jumbotron .lead {
        font-size: 1.8rem;
        margin-bottom: 30px;
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

    .reviews-section {
        background: #f8f9fa;
        color: #343a40;
        padding: 70px 50px;
        text-align: center;
        border-radius: 10px;
        margin-top: 50px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .reviews-section h1 {
        font-size: 3.5rem;
        margin-bottom: 40px;
    }

    .reviews-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-top: 30px;
    }

    .review-card {
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

    .review-card:hover {
        transform: scale(1.05);
    }

    .review-card img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        margin-bottom: 20px;
    }

    .review-card p {
        font-size: 1.4rem;
        line-height: 1.5;
        margin: 10px 0;
    }
</style>

<div class="jumbotron">
    <div class="mr-4">
        <img src="static/images/Golden_Power.png" style="max-width: 200px; position: absolute; top: 5px; left: 10px;">
    </div>
    <div>
        <h1>Customer Reviews</h1>
        <p class="lead">What our customers are saying about us</p>
    </div>
</div>

<div class="reviews-section">
    <div class="reviews-grid">
        <div class="review-card">
            <img src="static/images/reviewer1.jpg" alt="Reviewer 1">
            <p>"I love these products! They have really boosted my workout routine." - John Smith</p>
        </div>
        <div class="review-card">
            <img src="static/images/reviewer2.jpg" alt="Reviewer 2">
            <p>"Fantastic quality and design. Highly recommended!" - James Wilson</p>
        </div>
        <div class="review-card">
            <img src="static/images/reviewer3.jpg" alt="Reviewer 3">
            <p>"Great experience, fast delivery, and excellent service." - Robert Brown</p>
        </div>
        <div class="review-card">
            <img src="static/images/reviewer4.jpg" alt="Reviewer 4">
            <p>"The nutritional supplements made a huge difference in my training." - Mark Taylor</p>
        </div>
        <div class="review-card">
            <img src="static/images/reviewer5.jpg" alt="Reviewer 5">
            <p>"Really impressed by the quality of the gym equipment." - Michael Davis</p>
        </div>
        <div class="review-card">
            <img src="static/images/reviewer6.jpg" alt="Reviewer 6">
            <p>"A wonderful selection of sports goods. I will definitely buy again!" - William Wilson</p>
        </div>
    </div>
</div>
