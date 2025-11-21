# Bar Dashboard (`bar.html`)

## Overview
This dashboard provides an interface for viewing bar sales data for different periods: Day, Week, Month, Trimester, Semester, and Year. It is designed for admin use and displays sales in both USD and FC (foreign currency).

## How It Works
- **Dashboard Cards:** Each card represents a sales period. Clicking a card's "View Details" button opens a modal with a detailed sales table for that period.
- **Modals:** Each modal displays a table with columns: Product, Quantity, Amount (USD), and Amount (FC). The modal also includes a "Back" button to close it.
- **Navigation:** The dashboard is responsive and styled for modern browsers. The "Logout" card returns the user to the login page.
- **No Backend:** All data is static and hardcoded in the HTML for demonstration purposes. There is no dynamic data loading or backend integration.

## File Structure
- `bar.html`: Main dashboard and modal logic for bar sales.
- `css/`: Contains shared styles.
- `js/`: (If present) Can be used for future enhancements.

## Usage
1. Open `bar.html` in a browser.
2. Click any sales period card to view detailed sales data in a modal.
3. Use the "Back" button in each modal to return to the dashboard.
4. Use the "Logout" card to return to the login page.

## Customization
- To update sales data, edit the table rows in each modal.
- To add backend integration, replace the static tables with dynamic content using JavaScript and server APIs.

---
**Note:** This dashboard is for demonstration and internal use. For production, add authentication and connect to a real data source.