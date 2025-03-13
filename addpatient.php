<?php
// Database connection
$host = "localhost";
$user = "root"; // Default for XAMPP
$password = ""; // Leave empty for XAMPP
$database = "pathology_system";

$conn = mysqli_connect($host, $user, $password, $database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $gender = $_POST["gender"];
    $blood_group = $_POST["blood_group"];
    $phone_number = $_POST["phone_number"];
    $dob = $_POST["dob"];
    $age = $_POST["age"];
    $test_first_name = $_POST["test_first_name"];
    $test_last_name = $_POST["test_last_name"];

    $query = "INSERT INTO patients (first_name, last_name, gender, blood_group, phone_number, dob, age, test_first_name, test_last_name) 
              VALUES ('$first_name', '$last_name', '$gender', '$blood_group', '$phone_number', '$dob', '$age', '$test_first_name', '$test_last_name')";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Patient details saved successfully!');</script>";
    } else {
        echo "<script>alert('Error: " . mysqli_error($conn) . "');</script>";
    }

    mysqli_close($conn);
}
?>
