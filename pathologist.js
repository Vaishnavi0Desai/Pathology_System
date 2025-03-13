document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".submit-btn").addEventListener("click", function (event) {
        event.preventDefault(); // Prevent default form submission

        let p_id = document.getElementById("p_id").value.trim();
        let last_name = document.getElementById("last_name").value.trim();
        let first_name = document.getElementById("first_name").value.trim();
        let contact = document.getElementById("contact").value.trim();
        let address = document.getElementById("address").value.trim();
        let specialization = document.getElementById("specialization").value.trim();
        let gender = document.getElementById("gender").value;

        let phonePattern = /^[0-9]{10}$/; // Ensures 10-digit phone number

        if (p_id === "" || last_name === "" || first_name === "" || contact === "" || address === "" || specialization === "" || gender === "") {
            alert("All fields except Middle Name are required!");
            return;
        }

        if (!phonePattern.test(contact)) {
            alert("Enter a valid 10-digit phone number.");
            return;
        }

        document.querySelector("form").submit(); // Submit form if validation passes
    });
});
