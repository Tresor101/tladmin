# Warehouse Dashboard (`warehouse.html`)

## Overview
This dashboard provides an interface for warehouse inventory management for admins. It displays current stock, items taken out, items added, and low stock alerts, all organized in a card-based layout.

## How It Works
- **Dashboard Cards:** Each card represents a warehouse function (Current Stock, Items Taken Out, Items Added, Low Stock Alerts). Clicking "View Details" opens a modal with a detailed table.
- **Modals:** Each modal displays a table with relevant inventory data. The modal includes a "Back" button to close it.
- **Navigation:** The dashboard is responsive and styled for modern browsers. A "Back" card allows returning to the main dashboard.
- **No Backend:** All data is static and hardcoded in the HTML for demonstration purposes. There is no dynamic data loading or backend integration.

## File Structure
- `warehouse.html`: Main dashboard and modal logic for warehouse inventory.
- `css/`: Contains shared styles.
- `js/`: (If present) Can be used for future enhancements.

## Usage
1. Open `warehouse.html` in a browser.
2. Click any card to view detailed inventory data in a modal.
3. Use the "Back" button in each modal to return to the dashboard.
4. Use the "Back" card to return to the main dashboard.

## Customization
- To update inventory data, edit the table rows in each modal.
- To add backend integration, replace the static tables with dynamic content using JavaScript and server APIs.

---
**Note:** This dashboard is for demonstration and internal use. For production, add authentication and connect to a real data source.