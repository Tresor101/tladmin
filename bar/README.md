# Bar Dashboard (`bar.html`)

## Overview
This dashboard provides an interface for viewing both bar and restaurant sales data for different periods: Today, This Week, This Month, This Trimester, This Semester, and This Year. It is designed for admin use and displays sales in both USD and FC (foreign currency).

## How It Works

- **Dashboard Cards:**
	- Bar Sales: Each card represents a bar sales period (Today, This Week, This Month, This Trimester, This Semester, This Year). Clicking a card's "View Details" button opens a modal with a detailed sales table for that period.
	- Restaurant Sales: Each card represents a restaurant sales period (Today, This Week, This Month, This Trimester, This Semester, This Year). Clicking a card's "View Details" button opens a modal with a detailed restaurant orders table for that period.
- **Modals:**
	- Bar Sales modals display a table with columns: Product, Quantity, Amount (USD), and Amount (FC).
	- Restaurant Sales modals display a table with columns: Order Number, Composition (what was on the plate), Price (USD), and Price (FC).
	- Each modal includes a "Back" button to close it.
- **Navigation:** The dashboard is responsive and styled for modern browsers. The "Logout" card returns the user to the login page.
- **No Backend:** All data is static and hardcoded in the HTML for demonstration purposes. There is no dynamic data loading or backend integration.

## File Structure
- `bar.html`: Main dashboard and modal logic for bar and restaurant sales.
- `css/`: Contains shared styles.
- `js/`: (If present) Can be used for future enhancements.

## Usage
1. Open `bar.html` in a browser.
2. Click any Bar Sales or Restaurant Sales card to view detailed data in a modal.
3. Use the "Back" button in each modal to return to the dashboard.
4. Use the "Logout" card to return to the login page.

## Customization
- To update bar or restaurant sales data, edit the table rows in each modal.
- To add backend integration, replace the static tables with dynamic content using JavaScript and server APIs.

---
**Note:** This dashboard is for demonstration and internal use. For production, add authentication and connect to a real data source.