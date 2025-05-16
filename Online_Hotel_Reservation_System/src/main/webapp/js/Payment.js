function SelectPaymentMethod() {
	
    const method = document.getElementById("payment_method").value;
    const cardDetails = document.getElementById("card-details");
    const ezcashDetails = document.getElementById("ezcash-details");

    if (method === "Card") {
		
        cardDetails.style.display = "block";
        ezcashDetails.style.display = "none";
    
		} else if (method === "EzCash") {
			
        cardDetails.style.display = "none";
        ezcashDetails.style.display = "block";
    
		} else {
		
        cardDetails.style.display = "none";
        ezcashDetails.style.display = "none";
    
		}
}

window.onload = function () {
	
    SelectPaymentMethod(); 

	};