<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root"; // Change if different
$password = ""; // Change if different
$database = "pathology_system"; // Change your database name

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $p_id = $_POST["p_id"];
    $last_name = $_POST["last_name"];
    $first_name = $_POST["first_name"];
    $middle_name = $_POST["middle_name"];
    $contact_no = $_POST["contact_no"];
    $address = $_POST["address"];
    $gender = $_POST["gender"];

    $sql = "INSERT INTO phiebotamist (p_id, last_name, first_name, middle_name, contact_no, address, gender) 
            VALUES ('$p_id', '$last_name', '$first_name', '$middle_name', '$contact_no', '$address', '$gender')";

    if ($conn->query($sql) === TRUE) {
        // echo "<script>alert('Data successfully inserted!'); window.location.href='index.html';</script>";
        echo "<script>alert('Phiebotamist details saved successfully!');</script>";
    } else {
        echo "Error: " . $conn->error;
    }
}

$conn->close();
?>
