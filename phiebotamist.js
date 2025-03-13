function validatePhiebotamistForm() {
    console.log("Validation function triggered!"); // Debugging

    let isValid = true;

    function showError(input, message) {
        alert(message); // Shows error as an alert
        input.focus();
        isValid = false;
    }

    let pid = document.getElementById("p_id");
    let lastName = document.getElementById("last_name");
    let firstName = document.getElementById("first_name");
    let middleName = document.getElementById("middle_name");
    let contact = document.getElementById("contact_no");
    let address = document.getElementById("address");
    let gender = document.getElementById("gender");

    if (pid.value.trim() === "") showError(pid, "P. ID is required.");
    if (lastName.value.trim() === "") showError(lastName, "Last Name is required.");
    if (firstName.value.trim() === "") showError(firstName, "First Name is required.");
    if (!/^\d{10}$/.test(contact.value)) showError(contact, "Enter a valid 10-digit Contact Number.");
    if (address.value.trim() === "") showError(address, "Address is required.");
    if (gender.value === "Please Select") showError(gender, "Please select a gender.");

    return isValid;
}
