<?php
include('config.php'); // Database connection

// Fetch POST data safely
$bicycle_number = isset($_POST['bicycle_number']) ? mysqli_real_escape_string($conn, $_POST['bicycle_number']) : '';
$parking_slot = isset($_POST['slot_number']) ? mysqli_real_escape_string($conn, $_POST['slot_number']) : '';

// Validation
if (empty($bicycle_number) || empty($parking_slot)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required!']);
    exit();
}

// Check if the car has a reservation in that slot
$query = "SELECT * FROM bicycle_parking WHERE parking_slot = '$parking_slot' AND bicycle_number = '$bicycle_number' AND status = 'reserved'";
$result = mysqli_query($conn, $query);

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Database error: ' . mysqli_error($conn)]);
    exit();
}

if (mysqli_num_rows($result) > 0) {
    // Update status to occupied
    $update = "UPDATE bicycle_parking SET status = 'occupied' WHERE parking_slot = '$parking_slot' AND bicycle_number = '$bicycle_number'";
    if (mysqli_query($conn, $update)) {
        echo json_encode(['success' => true, 'message' => 'bicycle parked successfully!']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error updating status: ' . mysqli_error($conn)]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'No reservation found or already parked.']);
}

$conn->close();
?>