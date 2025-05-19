
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.needs-validation');
    
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        event.stopPropagation();
        
        let isValid = true;
        
        // Reset all error states
        const inputs = form.querySelectorAll('input, select');
        inputs.forEach(input => {
            input.classList.remove('is-invalid');
        });
        
        // Validate each required field
        const name = document.getElementById('name');
        const username = document.getElementById('username');
        const email = document.getElementById('email');
        const password = document.getElementById('password');
        const role = document.getElementById('role');
        
        // Check empty fields
        if (!name.value.trim()) {
            name.classList.add('is-invalid');
            isValid = false;
        }
        
        if (!username.value.trim()) {
            username.classList.add('is-invalid');
            isValid = false;
        } else if (!username.value.endsWith('@tendura_staff')) {
            username.classList.add('is-invalid');
            username.nextElementSibling.textContent = 'Username must end with @tendura_staff';
            isValid = false;
        }
        
        if (!email.value.trim()) {
            email.classList.add('is-invalid');
            isValid = false;
        } else if (!validateEmail(email.value)) {
            email.classList.add('is-invalid');
            email.nextElementSibling.textContent = 'Please enter a valid email address';
            isValid = false;
        }
        
        if (!password.value.trim()) {
            password.classList.add('is-invalid');
            isValid = false;
        }
        
        if (!role.value) {
            role.classList.add('is-invalid');
            isValid = false;
        }
        
        if (isValid) {
            form.submit();
        }
    }, false);
    
    // Email validation function
    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }
    
    // Add live validation for username
    const username = document.getElementById('username');
    username.addEventListener('input', function() {
        if (!this.value.endsWith('@tendura_staff')) {
            this.classList.add('is-invalid');
            this.nextElementSibling.textContent = 'Username must end with @tendura_staff';
        } else {
            this.classList.remove('is-invalid');
        }
    });
    
    // Add live validation for email
    const email = document.getElementById('email');
    email.addEventListener('input', function() {
        if (!validateEmail(this.value)) {
            this.classList.add('is-invalid');
            this.nextElementSibling.textContent = 'Please enter a valid email address';
        } else {
            this.classList.remove('is-invalid');
        }
    });
});


// Toggle password visibility
const togglePassword = document.getElementById('togglePassword');
const password = document.getElementById('password');

togglePassword.addEventListener('click', function() {
    // Toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    
    // Toggle the eye icon
    this.querySelector('i').classList.toggle('fa-eye');
    this.querySelector('i').classList.toggle('fa-eye-slash');
});
