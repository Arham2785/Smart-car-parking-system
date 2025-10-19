<?php
session_start(); // Start the session

include 'config.php'; // Database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validate inputs
    if (!empty($username) && !empty($password)) {
        // Enable detailed error reporting
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

        try {
            // Fetch user from the database
            $stmt = $conn->prepare("SELECT * FROM `USER DATA` WHERE `username` = ?");
            if (!$stmt) {
                die("Prepare failed: " . $conn->error); // Debugging output
            }

            // Bind the username parameter
            $stmt->bind_param("s", $username);

            // Execute the statement
            $stmt->execute();

            // Get the result
            $result = $stmt->get_result();

            // Check if a user exists
            if ($result && $result->num_rows === 1) {
                $row = $result->fetch_assoc();

                // Compare the passwords (as plain-text, though hashing is recommended)
                if ($password === $row['password']) {
                    $_SESSION['user_id'] = $row['id'];
                    echo "Login successful! Welcome, " . htmlspecialchars($row['username']);
                    // Redirect to a secure page
                    header("Location: home page of this project.html");
                    exit();
                } else {
                    echo "Invalid password.";
                }
            } else {
                echo "User not found.";
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    } else {
        echo "Please fill in both username and password.";
    }
} else {
    echo "Invalid request method.";
}

$conn->close();
?>
