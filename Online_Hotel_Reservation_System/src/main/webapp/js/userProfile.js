function updateProfile(){

    document.getElementById("fieldset1").disabled=false;
    document.getElementById("edit-btn").style.display="none";
    document.getElementById("update-btn").style.display="block";
    const inputs = document.querySelectorAll("#form1 input");
    inputs.forEach(input => {
        input.style.border = "1px solid #6c6c6c";
     });

}

function changePass(){

    document.getElementById("fieldset2").disabled=false;
    document.getElementById("cp-btn").style.display="none";
    document.getElementById("cp-update-btn").style.display="block";
    const inputs = document.querySelectorAll("#form2 input");
        inputs.forEach(input => {
            input.style.border = "1px solid #6c6c6c";
    });
}