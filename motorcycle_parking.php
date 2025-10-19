<?php
include('config.php'); // Database connection

// Ensure input is received safely
$motorcycle_number = isset($_POST['motorcycle_number']) ? mysqli_real_escape_string($conn, $_POST['motorcycle_number']) : '';
$owner_name = isset($_POST['owner_name']) ? mysqli_real_escape_string($conn, $_POST['owner_name']) : '';
$parking_slot = isset($_POST['slot_number']) ? mysqli_real_escape_string($conn, $_POST['slot_number']) : '';
$payment_method = isset($_POST['payment_method']) ? mysqli_real_escape_string($conn, $_POST['payment_method']) : '';
$phone_number = isset($_POST['phone_number']) ? mysqli_real_escape_string($conn, $_POST['phone_number']) : '';
$package = isset($_POST['package']) ? mysqli_real_escape_string($conn, $_POST['package']) : '';

// Validate inputs
//if (empty($motorcycle_number) || empty($owner_name) || empty($parking_slot) || empty($package) || empty($payment_method) || empty($phone_number)) {
  //  echo json_encode(['success' => false, 'message' => 'All fields are required!']);
    //exit();
//}

// Check if the slot is already reserved or occupied
$query = "SELECT * FROM motorcycle_parking WHERE parking_slot = '$parking_slot' AND status IN ('reserved', 'occupied')";
$result = mysqli_query($conn, $query);

if (!$result) {
    echo json_encode(['success' => false, 'message' => 'Database query error: ' . mysqli_error($conn)]);
    exit();
}

if (mysqli_num_rows($result) > 0) {
    echo "
    <div style='
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        background: linear-gradient(145deg, #ffe6e6, #ffffff);
        border: 1px solid #f5c6cb;
        border-radius: 15px;
        box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        font-family: Arial, sans-serif;
        text-align: center;
    '>
        <h2 style='color:rgb(65, 134, 199);'>🚫 Slot Already Reserved</h2>
        <p style='color:rgb(150, 86, 13); margin-bottom: 20px; font-size: 16px;'>This slot is already reserved or occupied. Please choose another one.</p>
        
        <form action='motorcycle option ma.html' method='get'>
            <button style='
                padding: 12px 24px;
                background: linear-gradient(135deg, #007bff, #0056b3);
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 15px;
                font-weight: bold;
                cursor: pointer;
                transition: transform 0.2s ease;
            ' onmouseover=\"this.style.transform='scale(1.05)'\" onmouseout=\"this.style.transform='scale(1)'\">
                🔄  Back to reserve another slot
            </button>
        </form>
    </div>";
} else {
    // Insert the new reservation with status 'reserved'
    $sql = "INSERT INTO motorcycle_parking (motorcycle_number, owner_name, parking_slot, package, status, payment_method, phone_number)
            VALUES ('$motorcycle_number', '$owner_name', '$parking_slot', '$package', 'reserved', '$payment_method', '$phone_number')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode(['success' => true, 'message' => 'Parking slot reserved successfully!']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error: ' . mysqli_error($conn)]);
    }
}

$conn->close();
?>
