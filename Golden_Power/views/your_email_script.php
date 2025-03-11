<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получите данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    // Укажите адрес электронной почты, на который будут отправлены письма
    $to = "89111183379k@gmail.com"; // Замените на ваш адрес электронной почты

    // Укажите тему письма
    $subject = "Новое сообщение от контакта: $name";

    // Создайте тело письма
    $body = "Имя: $name\n";
    $body .= "Email: $email\n\n";
    $body .= "Сообщение:\n$message\n";

    // Установите заголовки
    $headers = "From: $name <$email>\r\n";
    $headers .= "Reply-To: $email\r\n";

    // Отправьте письмо
    if (mail($to, $subject, $body, $headers)) {
        echo "Сообщение успешно отправлено!";
    } else {
        echo "Ошибка при отправке сообщения. Попробуйте позже.";
    }
} else {
    // Если скрипт вызван не через POST, перенаправим на форму
    header("Location: /contact.html");
}
?>

