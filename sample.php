<?php
$servername = "localhost";
$username = "root"; // Default for XAMPP/WAMP
$password = ""; // Empty password in XAMPP
$database = "pathology_system";

// Create database connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $dob = $_POST["dob"];
    $gender = $_POST["gender"];
    $contact = $_POST["contact"];
    $email = $_POST["email"];
    $address = $_POST["address"];
    $environment = $_POST["environment"];
    $collection_date = $_POST["collection_date"];
    $blood_group = $_POST["blood_group"];

    // Prepare SQL query
    $stmt = $conn->prepare("INSERT INTO patient_samples (first_name, last_name, dob, gender, contact, email, address, environment, collection_date, blood_group) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssssss", $first_name, $last_name, $dob, $gender, $contact, $email, $address, $environment, $collection_date, $blood_group);

    if ($stmt->execute()) {
        echo "<script>alert('Patient Sample details saved successfully!');</script>";
    } else {
        echo "<script>alert('Error saving data. Please try again.'); window.history.back();</script>";
    }

    $stmt->close();
}

$conn->close();
?>
