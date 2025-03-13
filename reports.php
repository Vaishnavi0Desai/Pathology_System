<?php
$conn = new mysqli("localhost", "root", "", "pathology_system");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to display a table with update and delete buttons
function displayTable($conn, $table, $columns, $primaryKey) {
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);

    echo "<h2 style='background: blue; color: white; padding: 5px;'>$table Data</h2>";
    echo "<table border='1'><tr>";

    // Table Headers
    foreach ($columns as $column) {
        echo "<th>$column</th>";
    }
    echo "<th>Actions</th></tr>";

    // Table Data
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        foreach ($columns as $column) {
            echo "<td>" . $row[$column] . "</td>";
        }
        echo "<td>
                <a href='reports.php?update_id=" . $row[$primaryKey] . "&table=$table'>Update</a> | 
                <a href='reports.php?delete_id=" . $row[$primaryKey] . "&table=$table' onclick='return confirm(\"Are you sure you want to delete this record?\")'>Delete</a>
              </td>";
        echo "</tr>";
    }
    echo "</table>";
}

// Display tables with respective columns
displayTable($conn, "patients", ["id", "first_name", "last_name", "gender","blood_group", "phone_number","dob","age","test_first_name","test_last_name"], "id");
displayTable($conn, "pathologists", ["id","p_id", "last_name", "first_name","middle_name","address", "specialization", "contact","gender"], "id");
displayTable($conn, "phiebotamist", ["id", "p_id","first_name", "last_name","middle_name", "contact_no","address","gender"], "id");
displayTable($conn, "patient_samples", ["id", "first_name","last_name","dob","gender","contact","email","address","environment","collection_date"], "id");

// Handle DELETE operation
if (isset($_GET['delete_id']) && isset($_GET['table'])) {
    $delete_id = $_GET['delete_id'];
    $table = $_GET['table'];
    $sql = "DELETE FROM $table WHERE id = $delete_id";
    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Record deleted successfully!'); window.location='reports.php';</script>";
    } else {
        echo "Error deleting record: " . $conn->error;
    }
}

// Handle UPDATE operation (Show update form)
if (isset($_GET['update_id']) && isset($_GET['table'])) {
    $update_id = $_GET['update_id'];
    $table = $_GET['table'];
    $result = $conn->query("SELECT * FROM $table WHERE id = $update_id");
    $row = $result->fetch_assoc();

    echo "<h2 style='background: green; color: white; padding: 5px;'>Update $table Record</h2>";
    echo "<form method='POST' action='reports.php'>";
    echo "<input type='hidden' name='id' value='$update_id'>";
    echo "<input type='hidden' name='table' value='$table'>";

    foreach ($row as $column => $value) {
        if ($column != "id") { // Don't allow updating primary key
            echo "$column: <input type='text' name='$column' value='$value'><br>";
        }
    }

    echo "<button type='submit' name='update_record'>Update</button>";
    echo "</form>";
}

// Handle UPDATE form submission
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['update_record'])) {
    $id = $_POST['id'];
    $table = $_POST['table'];

    $update_query = "UPDATE $table SET ";
    $fields = [];

    foreach ($_POST as $column => $value) {
        if ($column != "id" && $column != "table" && $column != "update_record") {
            $fields[] = "$column='$value'";
        }
    }

    $update_query .= implode(", ", $fields) . " WHERE id=$id";

    if ($conn->query($update_query) === TRUE) {
        echo "<script>alert('Record updated successfully!'); window.location='reports.php';</script>";
    } else {
        echo "Error updating record: " . $conn->error;
    }
}

$conn->close();
?>
