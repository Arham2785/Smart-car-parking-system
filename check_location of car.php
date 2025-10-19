<?php
include('config.php'); // Database connection

// Get POST data (car number)
$car_number = isset($_POST['car_number']) ? mysqli_real_escape_string($conn, $_POST['car_number']) : '';

// Validation
if (empty($car_number)) {
    echo json_encode(['success' => false, 'message' => 'Car number is required!']);
    exit();
}

// Check if car is parked
$query = "SELECT parking_slot FROM car_parking WHERE car_number = '$car_number' AND status = 'occupied' LIMIT 1";
$result = mysqli_query($conn, $query);

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . mysqli_error($conn)]);
    exit();
}

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    echo json_encode(['success' => true, 'slot_number' => $row['parking_slot']]);
} else {
    echo json_encode(['success' => false, 'message' => 'Car not found or not parked yet.']);
}

$conn->close();
?>