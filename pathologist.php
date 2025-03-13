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
    $p_id = $_POST["p_id"];
    $last_name = $_POST["last_name"];
    $first_name = $_POST["first_name"];
    $middle_name = isset($_POST["middle_name"]) ? $_POST["middle_name"] : "";
    $contact = $_POST["contact"];
    $address = $_POST["address"];
    $specialization = $_POST["specialization"]; // ✅ Correctly added specialization
    $gender = $_POST["gender"];

    // Prepare SQL query
    $stmt = $conn->prepare("INSERT INTO pathologists (p_id, last_name, first_name, middle_name, contact, address, specialization, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssss", $p_id, $last_name, $first_name, $middle_name, $contact, $address, $specialization, $gender);

    if ($stmt->execute()) {
        echo "<script>alert('Pathologist details saved successfully!'); </script>";
    } else {
        echo "<script>alert('Error saving data. Please try again.'); window.history.back();</script>";
    }

    $stmt->close();
}

$conn->close();
?>
