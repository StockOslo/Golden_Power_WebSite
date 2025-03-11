% rebase('layout.tpl', title=title, year=year)
<div class="jumbotron">
    <h1>My Account</h1>
    <p class="lead">Manage your profile and orders</p>
</div>

<div class="container">
    <!-- Первый ряд: Аватарка и информация о пользователе -->
    <div class="row">
        <div class="block profile-block">
            <div class="profile-photo">
                <img src="https://via.placeholder.com/150" alt="Profile Photo">
            </div>
            <div class="profile-info">
                <h2>John Doe</h2>
                <p>Email: <strong>john.doe@example.com</strong></p>
                <p>Phone: <strong>+1 234 567 89 00</strong></p>
                <a href="#edit-profile" class="btn btn-custom">Edit Profile</a>
            </div>
        </div>

        <div class="block stats-block">
            <h2>Account Stats</h2>
            <ul>
                <li>Total Orders: <strong>15</strong></li>
                <li>Completed Orders: <strong>12</strong></li>
                <li>Pending Orders: <strong>3</strong></li>
            </ul>
        </div>
    </div>

    <!-- Второй ряд: Заказы и настройки -->
    <div class="row">
        <div class="block orders-block">
            <h2>My Orders</h2>
            <div class="order-list">
                <div class="order-item">
                    <h3>Order #12345</h3>
                    <p>Status: <strong>Delivered</strong></p>
                    <p>Date: 10.10.2023</p>
                    <p>Total: $100.00</p>
                </div>
                <div class="order-item">
                    <h3>Order #12346</h3>
                    <p>Status: <strong>Processing</strong></p>
                    <p>Date: 12.10.2023</p>
                    <p>Total: $75.00</p>
                </div>
            </div>
        </div>

        <div class="block settings-block">
            <h2>Account Settings</h2>
            <ul>
                <li><a href="#change-password">Change Password</a></li>
                <li><a href="#privacy-settings">Privacy Settings</a></li>
                <li><a href="#notifications">Notifications</a></li>
            </ul>
        </div>
    </div>

    <!-- Третий ряд: Контакты -->
    <div class="row">
        <div class="block contact-block" id="contact">
            <h2>Contact Us</h2>
            <p>Email: <strong>support@example.com</strong></p>
            <p>Phone: <strong>+1 800 123 45 67</strong></p>
            <p>Address: <strong>123 Main St, Los Angeles, CA 90001</strong></p>
            <a href="#" class="btn btn-custom">Contact</a>
        </div>

        <div class="block social-block">
            <h2>Follow Us</h2>
            <ul>
                <li><a href="#facebook">Facebook</a></li>
                <li><a href="#twitter">Twitter</a></li>
                <li><a href="#instagram">Instagram</a></li>
            </ul>
        </div>
    </div>
</div>