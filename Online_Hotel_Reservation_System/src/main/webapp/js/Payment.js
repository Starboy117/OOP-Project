function SelectPaymentMethod() {
    const method = document.getElementById("payment_method").value;
    const cardDetails = document.getElementById("card-details");
    const ezcashDetails = document.getElementById("ezcash-details");

    const cardName = document.getElementById("card_name");
    const cardNumber = document.getElementById("card_number");
    const expiryDate = document.getElementById("expiry_date");
    const cvv = document.getElementById("cvv");
    const mobileNumber = document.getElementById("mobile_number");

    if (method === "Card") {
        cardDetails.style.display = "block";
        ezcashDetails.style.display = "none";

        cardName.required = true;
        cardNumber.required = true;
        expiryDate.required = true;
        cvv.required = true;
        mobileNumber.required = false;
    } else if (method === "EzCash") {
        cardDetails.style.display = "none";
        ezcashDetails.style.display = "block";

        cardName.required = false;
        cardNumber.required = false;
        expiryDate.required = false;
        cvv.required = false;
        mobileNumber.required = true;
    } else {
        cardDetails.style.display = "none";
        ezcashDetails.style.display = "none";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    SelectPaymentMethod();

    const form = document.getElementById("paymentForm");

    form.addEventListener("submit", function (e) {
        const method = document.getElementById("payment_method").value;

        const cardName = document.getElementById("card_name");
        const cardNumber = document.getElementById("card_number");
        const expiryDate = document.getElementById("expiry_date");
        const cvv = document.getElementById("cvv");
        const mobileNumber = document.getElementById("mobile_number");

        if (method === "Card") {
            if (
                !cardName.value.trim() ||
                !cardNumber.value.trim() ||
                !expiryDate.value ||
                !cvv.value.trim()
            ) {
                alert("Please fill in all card details.");
                e.preventDefault();
            }
        } else if (method === "EzCash") {
            if (!mobileNumber.value.trim()) {
                alert("Please enter your EzCash mobile number.");
                e.preventDefault();
            }
        } else {
            alert("Please select a payment method.");
            e.preventDefault();
        }
    });
});
