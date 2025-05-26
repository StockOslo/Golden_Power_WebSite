// Useful_articles.js
document.addEventListener("DOMContentLoaded", function() {
    // Получаем параметры URL
    const params = new URLSearchParams(window.location.search);
    if (params.get("email_error") === "1") {
        alert("This email is already registered with another author.");
        // Очищаем параметры, чтобы alert больше не показывался
        window.location.href = window.location.pathname;
    }
});