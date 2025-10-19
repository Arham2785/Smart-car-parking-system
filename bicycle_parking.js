document.addEventListener("DOMContentLoaded", () => {
    // Define the available slots
    const slots = [
        { number: 1, status: "available" },
        { number: 2, status: "available" },
        { number: 3, status: "available" },
        { number: 4, status: "available" },
        { number: 5, status: "available" },
        { number: 6, status: "available" },
        { number: 7, status: "available" },
        { number: 8, status: "available" },
        { number: 9, status: "available" },
        { number: 10, status: "available" },
        { number: 11, status: "available" },
        { number: 12, status: "available" },
        { number: 13, status: "available" },
        { number: 14, status: "available" },
        { number: 15, status: "available" },
        { number: 16, status: "available" },
        { number: 17, status: "available" },
        { number: 18, status: "available" },
        { number: 19, status: "available" },
        { number: 20, status: "available" },
        { number: 21, status: "available" },
        { number: 22, status: "available" },
        { number: 23, status: "available" },
        { number: 24, status: "available" },
        { number: 25, status: "available" },
        { number: 26, status: "available" },
        { number: 27, status: "available" },
        { number: 28, status: "available" },
        { number: 29, status: "available" },
        { number: 30, status: "available" },
        { number: 31, status: "available" },
        { number: 32, status: "available" },
        { number: 33, status: "available" },
        { number: 34, status: "available" },
        { number: 35, status: "available" },
        { number: 36, status: "available" },
        { number: 37, status: "available" },
        { number: 38, status: "available" },
        { number: 39, status: "available" },
        { number: 40, status: "available" },
        { number: 41, status: "available" },
        { number: 42, status: "available" },
        { number: 43, status: "available" },
        { number: 44, status: "available" },
        { number: 45, status: "available" },
        { number: 46, status: "available" },
        { number: 47, status: "available" },
        { number: 48, status: "available" },
        { number: 49, status: "available" },
        { number: 50, status: "available" },
        { number: 51, status: "available" },
        { number: 52, status: "available" },
        { number: 53, status: "available" },
        { number: 54, status: "available" },
        { number: 55, status: "available" },
        { number: 56, status: "available" },
        { number: 57, status: "available" },
        { number: 58, status: "available" },
        { number: 59, status: "available" },
        { number: 60, status: "available" },
        { number: 61, status: "available" },
        { number: 62, status: "available" },
        { number: 63, status: "available" },
        { number: 64, status: "available" },
    ];

    // Function to render the slots
    function renderSlots() {
        const grid = document.getElementById('slots-grid');
        grid.innerHTML = ""; // Clear any existing slots
        slots.forEach(slot => {
            const div = document.createElement('div');
            div.classList.add('slot', slot.status);
            div.textContent = Space ${slot.number};
            div.onclick = () => reserveSlot(slot);
            grid.appendChild(div);
        });
    }

    // Function to reserve a slot
    function reserveSlot(slot) {
        if (slot.status === "available") {
            // If available, open the reservation form
            const carNumber = prompt("Enter your bicycle number:");
            const ownerName = prompt("Enter your name:");
            if (carNumber && ownerName) {
                // Send data to backend to reserve slot
                fetch('bicycle_parking.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        bicycle_number: "ABC123",
                        owner_name: "John Doe",
                        slot_number: 5
                    })
                })
                .then(response => response.json())
                .then(data => console.log(data))
                .catch(error => console.error("Error:", error));
                .then(data => {
                    if (data.success) {
                        slot.status = 'reserved'; // Update the status
                        renderSlots(); // Re-render the slots to reflect change
                        alert(Slot ${slot.number} reserved successfully!);
                    } else {
                        alert("Failed to reserve slot. Please try again.");
                    }
                });
            }
        } else {
            alert("This slot is already taken or reserved.");
        }
    }

    // Function to park a car
    document.getElementById('park-form').addEventListener('submit', (e) => {
        e.preventDefault();
        const carNumber = e.target.car_number.value;
        const slotNumber = parseInt(e.target.slot_number.value);
        const slot = slots.find(slot => slot.number === slotNumber);

        if (slot && slot.status === 'reserved') {
            // Park the car
            fetch('park_car of bicycle.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    bicycle_number: bicycleNumber,
                    slot_number: slotNumber,
                }),
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    slot.status = 'occupied'; // Update the status
                    renderSlots();
                    alert("Car parked successfully!");
                } else {
                    alert("Failed to park the car. Check your reservation.");
                }
            });
        } else {
            alert("Slot is not reserved or invalid slot.");
        }
    });

    // Function to check bicycle location
    document.getElementById('check-form').addEventListener('submit', (e) => {
        e.preventDefault();
        const carNumber = e.target.car_number.value;

        fetch('check_location of bicycle.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ bicycle_number: bicycleNumber }),
        })
        .then(response => response.json())
        .then(data => {
            const locationText = data.success
                ? Your car is parked at Space ${data.slot_number}.
                : "bicycle not found or not parked yet.";
            document.getElementById('bicycle-location').textContent = locationText;
        });
    });

    // Initial render of parking slots
    renderSlots();
});