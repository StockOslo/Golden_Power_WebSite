<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // �������� ������ �� �����
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    // ������� ����� ����������� �����, �� ������� ����� ���������� ������
    $to = "89111183379k@gmail.com"; // �������� �� ��� ����� ����������� �����

    // ������� ���� ������
    $subject = "����� ��������� �� ��������: $name";

    // �������� ���� ������
    $body = "���: $name\n";
    $body .= "Email: $email\n\n";
    $body .= "���������:\n$message\n";

    // ���������� ���������
    $headers = "From: $name <$email>\r\n";
    $headers .= "Reply-To: $email\r\n";

    // ��������� ������
    if (mail($to, $subject, $body, $headers)) {
        echo "��������� ������� ����������!";
    } else {
        echo "������ ��� �������� ���������. ���������� �����.";
    }
} else {
    // ���� ������ ������ �� ����� POST, ������������ �� �����
    header("Location: /contact.html");
}
?>

