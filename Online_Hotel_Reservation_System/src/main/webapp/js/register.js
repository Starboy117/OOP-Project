function validateForm() {
    var name = document.getElementById("name");
    var username = document.getElementById("uname");
    var email = document.getElementById("email");
    var pass = document.getElementById("password");
    var cpass = document.getElementById("cPassword");

    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var isValid = true;

    // Name
    if (name.value.trim() === "") {
        name.style.border = "1px solid red";
        document.getElementById("msg1").innerText = "**Name cannot be empty";
        isValid = false;
    } else {
        name.style.border = "1px solid #4CAF50";
        document.getElementById("msg1").innerText = "";
    }

    // Username
    if (username.value.trim() === "") {
        username.style.border = "1px solid red";
        document.getElementById("msg2").innerText = "**Username cannot be empty";
        isValid = false;
    } else {
        username.style.border = "1px solid #4CAF50";
        document.getElementById("msg2").innerText = "";
    }

    // Email
    if (email.value.trim() === "") {
        email.style.border = "1px solid red";
        document.getElementById("msg3").innerText = "**Email cannot be empty";
        isValid = false;
    } else if (!emailPattern.test(email.value)) {
        email.style.border = "1px solid red";
        document.getElementById("msg3").innerText = "**Invalid email format";
        isValid = false;
    } else {
        email.style.border = "1px solid #4CAF50";
        document.getElementById("msg3").innerText = "";
    }

   
	if (pass.value.trim() === "") {
		
		
	    pass.style.border = "1px solid red";
	    document.getElementById("msg4").innerText = "**Password cannot be empty";
		
		
	    isValid = false;
		
		
	} else if (pass.value.length < 6) {
		
		
	    pass.style.border = "1px solid red";
	    document.getElementById("msg4").innerText = "**Password too short";
		
		
		
	    isValid = false;
		
		
	} else {
		
	    pass.style.border = "1px solid #4CAF50";
	    document.getElementById("msg4").innerText = "";
	}


	if (cpass.value.trim() === "") {
		
		
	    cpass.style.border = "1px solid red";
	    document.getElementById("msg5").innerText = "**Confirm password cannot be empty";
		
	    isValid = false;
		
		
	} else if (pass.value !== cpass.value) {
	    
	    cpass.style.border = "1px solid red";
	    pass.style.border = "1px solid red";
	    document.getElementById("msg5").innerText = "**Passwords don't match";
	    isValid = false;
		
		
	} else if (pass.value.length >= 6 && pass.value === cpass.value) {
		
		
	    pass.style.border = "1px solid #4CAF50";
	    cpass.style.border = "1px solid #4CAF50";
	    document.getElementById("msg4").innerText = "";
	    document.getElementById("msg5").innerText = "";
	}


    return isValid;
}

