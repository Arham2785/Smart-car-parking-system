<?php
$servername = "localhost"; // XAMPP کے لیے localhost ہی رہے گا
$username = "root"; // XAMPP میں ڈیفالٹ یوزر root ہوتا ہے
$password = ""; // XAMPP میں ڈیفالٹ طور پر پاسورڈ خالی ہوتا ہے
$dbname = "smart parking system"; // اپنے ڈیٹا بیس کا نام یہاں لکھیں

// کنکشن بنائیں
$conn = new mysqli($servername, $username, $password, $dbname);

// کنکشن چیک کریں
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Database connected successfully!";
}
?>
