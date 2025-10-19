<?php
include('config.php'); // Database connection

// Get the POST data (Name, Email, and Message)
$name = isset($_POST['name']) ? mysqli_real_escape_string($conn, $_POST['name']) : '';
$email = isset($_POST['email']) ? mysqli_real_escape_string($conn, $_POST['email']) : '';
$message = isset($_POST['message']) ? mysqli_real_escape_string($conn, $_POST['message']) : '';

// Basic validation to check if the fields are empty
if (empty($name) || empty($email) || empty($message)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required!']);
    exit();
}

// Insert the contact form data into the database
$query = "INSERT INTO contact_admin (name, email, message) VALUES ('$name', '$email', '$message')";

if (mysqli_query($conn, $query)) {
    echo json_encode(['success' => true, 'message' => 'Your message has been sent to the admin.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to send the message. ' . mysqli_error($conn)]);
}

$conn->close();
?>