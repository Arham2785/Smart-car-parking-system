 
 


document.addEventListener("DOMContentLoaded", () => {
   
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
            const carNumber = prompt("Enter your car number:");
            const ownerName = prompt("Enter your name:");
            if (carNumber && ownerName) {
                // Send data to backend to reserve slot
                fetch('car_parking.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        car_number: "ABC123",
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
            fetch('park_car.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    car_number: carNumber,
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

    // Function to check car location
    document.getElementById('check-form').addEventListener('submit', (e) => {
        e.preventDefault();
        const carNumber = e.target.car_number.value;

        fetch('check_location.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ car_number: carNumber }),
        })
        .then(response => response.json())
        .then(data => {
            const locationText = data.success
                ? Your car is parked at Space ${data.slot_number}.
                : "Car not found or not parked yet.";
            document.getElementById('car-location').textContent = locationText;
        });
    });

    // Initial render of parking slots
    renderSlots();
});