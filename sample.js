document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".submit-btn").addEventListener("click", function (event) {
        event.preventDefault(); // Prevent default form submission

        let first_name = document.getElementById("first_name").value.trim();
        let last_name = document.getElementById("last_name").value.trim();
        let dob = document.getElementById("dob").value.trim();
        let gender = document.getElementById("gender").value;
        let contact = document.getElementById("contact").value.trim();
        let email = document.getElementById("email").value.trim();
        let address = document.getElementById("address").value.trim();
        let environment = document.getElementById("environment").value.trim();
        let collection_date = document.getElementById("collection_date").value.trim();
        let blood_group = document.getElementById("blood_group").value;

        let phonePattern = /^[0-9]{10}$/; // Ensures 10-digit phone number
        let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // Validates email format

        if (first_name === "" || last_name === "" || dob === "" || gender === "" || contact === "" || email === "" || address === "" || environment === "" || collection_date === "" || blood_group === "") {
            alert("All fields are required!");
            return;
        }

        if (!phonePattern.test(contact)) {
            alert("Enter a valid 10-digit phone number.");
            return;
        }

        if (!emailPattern.test(email)) {
            alert("Enter a valid email address.");
            return;
        }

        document.querySelector("form").submit(); // Submit form if validation passes
    });
});
