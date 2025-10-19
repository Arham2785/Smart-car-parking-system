// JavaScript to handle the dynamic form visibility

document.addEventListener('DOMContentLoaded', function() {

    // Get the buttons and form containers
    const changePasswordBtn = document.getElementById('changePasswordBtn');
    const updateEmailBtn = document.getElementById('updateEmailBtn');
    const managePaymentBtn = document.getElementById('managePaymentBtn');

    const changePasswordForm = document.getElementById('changePasswordForm');
    const updateEmailForm = document.getElementById('updateEmailForm');
    const managePaymentForm = document.getElementById('managePaymentForm');

    const cancelPasswordBtn = document.getElementById('cancelPasswordBtn');
    const cancelEmailBtn = document.getElementById('cancelEmailBtn');
    const cancelPaymentBtn = document.getElementById('cancelPaymentBtn');

    // Event listeners for buttons to show corresponding forms
    changePasswordBtn.addEventListener('click', function() {
        hideAllForms();
        changePasswordForm.style.display = 'block';
    });

    updateEmailBtn.addEventListener('click', function() {
        hideAllForms();
        updateEmailForm.style.display = 'block';
    });

    managePaymentBtn.addEventListener('click', function() {
        hideAllForms();
        managePaymentForm.style.display = 'block';
    });

    // Event listeners for cancel buttons
    cancelPasswordBtn.addEventListener('click', function() {
        changePasswordForm.style.display = 'none';
    });

    cancelEmailBtn.addEventListener('click', function() {
        updateEmailForm.style.display = 'none';
    });

    cancelPaymentBtn.addEventListener('click', function() {
        managePaymentForm.style.display = 'none';
    });

    // Function to hide all forms
    function hideAllForms() {
        changePasswordForm.style.display = 'none';
        updateEmailForm.style.display = 'none';
        managePaymentForm.style.display = 'none';
    }

});
