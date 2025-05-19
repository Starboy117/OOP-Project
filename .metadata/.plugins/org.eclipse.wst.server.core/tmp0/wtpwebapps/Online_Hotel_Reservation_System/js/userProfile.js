
document.addEventListener('DOMContentLoaded', function() {
    function updateProfile() {
        document.getElementById("fieldset1").disabled = false;
        document.getElementById("edit-btn").style.display = "none";
        document.getElementById("update-btn").style.display = "block";
        const inputs = document.querySelectorAll("#form1 input");
        inputs.forEach(input => {
            input.style.border = "1px solid #6c6c6c";
        });
    }

    function changePass() {
        document.getElementById("fieldset2").disabled = false;
        document.getElementById("cp-btn").style.display = "none";
        document.getElementById("cp-update-btn").style.display = "block";
        const inputs = document.querySelectorAll("#form2 input");
        inputs.forEach(input => {
            input.style.border = "1px solid #6c6c6c";
        });
    }

    // Password visibility toggle
    const togglePassword = document.querySelector('#togglePassword');
    const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
    const password = document.querySelector('#password');
    const confirmPassword = document.querySelector('#confirmPassword');

    if (togglePassword && password) {
        togglePassword.addEventListener('click', function() {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            
            // toggle the icon
            this.classList.toggle('bi-eye');
            this.classList.toggle('bi-eye-slash');
        });
    }

    if (toggleConfirmPassword && confirmPassword) {
        toggleConfirmPassword.addEventListener('click', function() {
            // toggle the type attribute
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            
            // toggle the icon
            this.classList.toggle('bi-eye');
            this.classList.toggle('bi-eye-slash');
        });
    }

    // Make functions available globally if needed
    window.updateProfile = updateProfile;
    window.changePass = changePass;
});
