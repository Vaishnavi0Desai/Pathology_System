function validateForm() {
    let isValid = true;

    function showError(id, message) {
        document.getElementById(id).innerText = message;
        isValid = false;
    }

    function clearErrors() {
        document.querySelectorAll("small").forEach(el => el.innerText = "");
    }

    clearErrors();

    let firstName = document.getElementById("first_name").value.trim();
    let lastName = document.getElementById("last_name").value.trim();
    let gender = document.getElementById("gender").value;
    let bloodGroup = document.getElementById("blood_group").value.trim();
    let phone = document.getElementById("phone_number").value.trim();
    let dob = document.getElementById("dob").value;
    let age = document.getElementById("age").value.trim();
    let testFirstName = document.getElementById("test_first_name").value.trim();
    let testLastName = document.getElementById("test_last_name").value.trim();

    if (firstName === "") showError("first_name_error", "First Name is required.");
    if (lastName === "") showError("last_name_error", "Last Name is required.");
    if (gender === "") showError("gender_error", "Please select a gender.");
    if (bloodGroup === "") showError("blood_group_error", "Blood Group is required.");
    if (!/^\d{10}$/.test(phone)) showError("phone_number_error", "Enter a valid 10-digit phone number.");
    if (dob === "") showError("dob_error", "Date of Birth is required.");
    if (age === "" || age <= 0) showError("age_error", "Enter a valid age.");
    if (testFirstName === "" || testLastName === "") showError("test_error", "Tester's name is required.");

    return isValid;
}
