<?php
include 'config.php'; // Database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $phone_number = $_POST['phone_number'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Check if passwords match
    if ($password !== $confirm_password) {
        die("Passwords do not match!");
    }

    // Enable detailed error reporting
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

    try {
        // Prepare the query
        $stmt = $conn->prepare("INSERT INTO `USER DATA` (username, email, phone_number, password, confirm_password) VALUES (?, ?, ?, ?, ?)");
        if (!$stmt) {
            die("Prepare failed: " . $conn->error); // Debugging output
        }

        // Bind parameters
        $stmt->bind_param("sssss", $username, $email, $phone_number, $password, $confirm_password);

        // Execute the statement
        $stmt->execute();

        // Redirect to login.html after successful insertion
        header("Location: login.html");
        exit(); // Always include exit() after header redirect

    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
