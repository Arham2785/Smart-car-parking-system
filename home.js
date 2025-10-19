// Contact Admin Function
function contactAdmin() {
    alert(" Message on 03116789485");
}

// Update available and booked slots dynamically
document.addEventListener("DOMContentLoaded", function() {
    let availableSlots = document.querySelectorAll(".feature-list .feature");
    let availableCount = availableSlots.length;
    let bookedCount = 10 - availableCount; // Example calculation

    document.getElementById("available-count").textContent = availableCount;
    document.getElementById("booked-count").textContent = bookedCount;
});
