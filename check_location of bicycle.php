<?php
include('config.php'); // Database connection

// Get POST data (car number)
$bicycle_number = isset($_POST['bicycle_number']) ? mysqli_real_escape_string($conn, $_POST['bicycle_number']) : '';

// Validation
if (empty($bicycle_number)) {
    echo json_encode(['success' => false, 'message' => 'bicycle number is required!']);
    exit();
}

// Check if car is parked
$query = "SELECT parking_slot FROM bicycle_parking WHERE bicycle_number = '$bicycle_number' AND status = 'occupied' LIMIT 1";
$result = mysqli_query($conn, $query);

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . mysqli_error($conn)]);
    exit();
}

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    echo json_encode(['success' => true, 'slot_number' => $row['parking_slot']]);
} else {
    echo json_encode(['success' => false, 'message' => 'bicycle not found or not parked yet.']);
}

$conn->close();
?>