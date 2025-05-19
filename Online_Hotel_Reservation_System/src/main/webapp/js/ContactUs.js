document.addEventListener('DOMContentLoaded', function() {
    // Form validation
    const form = document.getElementById('contactForm');
    if (form) {
        form.addEventListener('submit', function(e) {
            // Client-side validation
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const message = document.getElementById('message').value.trim();
            
            if (!name || !email || !message) {
                e.preventDefault();
                showAlert('All fields are required.', 'danger');
                return;
            }
            
            if (!validateEmail(email)) {
                e.preventDefault();
                showAlert('Please enter a valid email address.', 'danger');
                return;
            }
        });
    }
    
    // Remove alerts after 5 seconds
    setTimeout(() => {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            alert.style.transition = 'opacity 1s';
            alert.style.opacity = '0';
            setTimeout(() => alert.remove(), 1000);
        });
    }, 5000);
});

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function showAlert(message, type) {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type} mt-3`;
    alertDiv.textContent = message;
    
    const form = document.querySelector('.contact-form');
    if (form) {
        // Insert after the h3 title
        const title = form.querySelector('h3');
        if (title) {
            title.insertAdjacentElement('afterend', alertDiv);
        } else {
            form.prepend(alertDiv);
        }
    }
    
    // Auto-remove after 5 seconds
    setTimeout(() => {
        alertDiv.style.transition = 'opacity 1s';
        alertDiv.style.opacity = '0';
        setTimeout(() => alertDiv.remove(), 1000);
    }, 5000);
}