// Basic form validation example
const form = document.querySelector('form');
form.addEventListener('submit', function(e) {
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();
    if (!email || !password) {
        alert('Please enter both email and password.');
        e.preventDefault();
        return;
    }
    // Hardcoded admin credentials
    if (email === 'admin@tresorlodge.com' && password === '#admi123!') {
        e.preventDefault();
        showAdminOptions();
    } else {
        e.preventDefault();
        alert('Invalid email or password.');
    }
});

function showAdminOptions() {
    const container = document.querySelector('.login-container');
    container.innerHTML = `
        <h2>Admin Dashboard</h2>
        <div class="dashboard">
            <div class="dashboard-card">
                <h3>Bar &amp; Restaurant</h3>
                <p>Manage menu, orders, and staff.</p>
                <button class="login-btn" onclick="window.location.href='bar/bar.html'">Go to Bar &amp; Restaurant</button>
            </div>
            <div class="dashboard-card">
                <h3>Room</h3>
                <p>View bookings, check-ins, and room status.</p>
                <button class="login-btn" onclick="window.location.href='room/room.html'">Go to Room</button>
            </div>
            <div class="dashboard-card">
                <h3>Warehouse</h3>
                <p>Inventory and supply management.</p>
                <button class="login-btn" onclick="window.location.href='warehouse/warehouse.html'">Go to Warehouse</button>
            </div>
        </div>
    `;
}
