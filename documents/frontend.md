# Frontend Specification

# Mongo Salon POS

Version: 1.0

---

# 1. Introduction

## Purpose

This document defines the frontend requirements, user interface structure, navigation, pages, forms, components, workflows, and user interactions for Mongo Salon POS.

The objective is to provide a consistent and user-friendly experience across all business modules.

---

# 2. Application Layout

## Primary Layout

```text
+------------------------------------------------------+
| Header                                                |
+------------------------------------------------------+
| Sidebar | Main Content Area                           |
|         |                                             |
|         |                                             |
+------------------------------------------------------+
| Footer                                                 |
+------------------------------------------------------+
```

---

## Header

Contains:

* Application Logo
* Current User
* Notifications
* Search
* Profile Menu
* Logout

---

## Sidebar Menu

```text
Dashboard

Appointments
    Calendar
    New Appointment

Customers

Billing

Services

Products

Vendors

Employees

Expenses

Campaigns

Leads

Reports

Feedback

Complaints

Settings
```

---

# 3. Authentication Module

## Login Page

### Route

```text
/login
```

### Fields

| Field    | Type     |
| -------- | -------- |
| Username | Text     |
| Password | Password |

### Actions

* Login
* Forgot Password

---

## Forgot Password

### Route

```text
/forgot-password
```

### Fields

* Username
* Email

---

# 4. Dashboard

## Route

```text
/dashboard
```

---

## Dashboard Widgets

### Revenue Summary

Displays:

* Today's Revenue
* Weekly Revenue
* Monthly Revenue

---

### Appointment Summary

Displays:

* Total Appointments
* Booked
* Checked-In
* In-Service
* Cancelled
* No Show

---

### Customer Summary

Displays:

* New Customers
* Repeat Customers
* High Value Customers

---

### Staff Performance

Displays:

* Top Staff
* Revenue Generated
* Services Completed

---

### Lead Summary

Displays:

* New Leads
* Converted Leads
* Follow-Up Leads

---

## Dashboard Charts

### Revenue Trend

Line Chart

### Appointment Trend

Bar Chart

### Customer Trend

Line Chart

### Campaign Performance

Bar Chart

---

# 5. Appointment Module

## Routes

```text
/appointments

/appointments/create

/appointments/calendar

/appointments/{id}
```

---

## Appointment List

### Features

* Search
* Filter
* Pagination
* Export

### Filters

* Date
* Status
* Customer
* Staff
* Source

---

## Appointment Calendar

### Views

* Day
* Week
* Month

### Features

* Drag and Drop
* Color Coded Statuses

---

## Create Appointment

### Step 1

Customer Lookup

Field:

* Phone Number

Actions:

* Search Existing Customer
* Create New Customer

---

### Step 2

Customer Details

Fields:

* Name
* Phone
* Email

---

### Step 3

Service Selection

Display:

* Services
* Duration
* Price

---

### Step 4

Staff Selection

Display:

* Available Staff Only

---

### Step 5

Confirmation

Display:

* Services
* Staff
* Timing
* Total Cost

---

## Appointment Details

### Information

* Customer
* Services
* Staff
* Status
* Notes

### Actions

* Check-In
* Start Service
* Check-Out
* Cancel
* No Show

---

# 6. Service Slip Module

## Route

```text
/service-slips/{id}
```

---

## Service Slip Screen

### Sections

#### Customer Information

* Name
* Phone

#### Service Information

* Service
* Staff
* Duration
* Price

#### Pricing

* Discount
* Tax
* Total

---

### Actions

* Generate Slip
* Regenerate Slip
* Print Slip

---

# 7. Customer Module

## Routes

```text
/customers

/customers/create

/customers/{id}
```

---

## Customer List

### Features

* Search
* Pagination
* Export

### Filters

* Membership
* High Value
* Repeat Customer

---

## Customer Profile

### Personal Information

* Name
* Gender
* DOB
* Anniversary

### Contact Information

* Phone
* Email
* Address

### Membership Information

* Membership
* Prepaid Cards
* Loyalty Points

### Visit History

* Appointments
* Bills

### Feedback History

* Ratings
* Comments

---

# 8. Billing Module

## Route

```text
/billing
```

---

## Billing Screen

### Customer Section

Displays:

* Customer Information
* Membership Status
* Loyalty Points

---

### Services Section

Displays:

* Service Slip Data

---

### Product Section

Displays:

* Retail Products

---

### Payment Section

Displays:

* Payment Methods
* Amount Breakdown

---

### Invoice Summary

Displays:

* Subtotal
* Discount
* Tax
* Total

---

### Actions

* Generate Invoice
* Print Invoice
* Email Invoice
* Send SMS

---

# 9. Service Management

## Routes

```text
/services

/service-categories
```

---

## Service List

Displays:

* Name
* Category
* Duration
* Price

---

## Service Form

### Fields

* Name
* Category
* Duration
* Price
* Description

---

### Product Mapping

Associate products with services.

---

# 10. Product Management

## Routes

```text
/products

/products/create

/products/{id}
```

---

## Product List

Displays:

* Product Name
* Type
* Stock
* Vendor
* Price

---

## Product Form

### Fields

* Product Name
* Product Type
* Vendor
* Minimum Quantity
* Current Stock
* Price

---

## Inventory History

Displays:

* Purchases
* Service Usage
* Sales
* Adjustments

---

# 11. Vendor Management

## Routes

```text
/vendors

/vendors/create

/vendors/{id}
```

---

## Vendor Form

### Fields

* Vendor Name
* Phone
* Primary Contact
* Secondary Contact
* Address
* GST Number

---

## Vendor Details

Displays:

* Purchase Orders
* Invoices
* Payments

---

# 12. Purchase Orders

## Routes

```text
/purchase-orders

/purchase-orders/create
```

---

## Purchase Order Form

### Sections

* Vendor Selection
* Product Selection
* Quantity
* Pricing

---

### Actions

* Save Draft
* Send Purchase Order

---

# 13. Employee Management

## Routes

```text
/employees

/employees/create

/employees/{id}
```

---

## Employee List

Displays:

* Name
* Designation
* Phone
* Status

---

## Employee Form

### Fields

* Personal Information
* Contact Information
* Salary
* Skills
* Notes

---

## Employee Profile

### Sections

* Personal Information
* Skills
* Shifts
* Appointments
* Performance

---

# 14. Shift Management

## Routes

```text
/shifts

/shifts/create
```

---

## Shift Calendar

Displays:

* Daily Shifts
* Weekly Shifts
* Monthly Shifts

---

## Shift Form

### Fields

* Employee
* Date
* Start Time
* End Time

---

# 15. Expense Management

## Routes

```text
/expenses

/day-book
```

---

## Expense Form

### Fields

* Category
* Description
* Amount
* Payment Method
* Authorized By

---

## Day Book Screen

Displays:

* Opening Cash
* Cash Sales
* Cash Expenses
* Closing Cash

---

# 16. Campaign Management

## Routes

```text
/campaigns

/campaigns/create
```

---

## Campaign List

Displays:

* Name
* Type
* Status

---

## Campaign Form

### Fields

* Campaign Name
* Campaign Type
* Message Template

---

## Campaign Rules

### Fields

* Criteria
* Repeat Count
* Active Status

---

# 17. Lead Management

## Routes

```text
/leads

/leads/create

/leads/{id}
```

---

## Lead List

Displays:

* Name
* Phone
* Status
* Follow-Up Date

---

## Lead Form

### Fields

* Name
* Phone
* Email
* Requested Service
* Follow-Up Date
* Notes

---

## Lead Actions

* Update Status
* Add Follow-Up
* Convert To Customer

---

# 18. Feedback Module

## Route

```text
/feedback
```

---

## Feedback List

Displays:

* Customer
* Staff
* Rating
* Date

---

## Feedback Details

Displays:

* Customer Details
* Rating
* Comments

---

## Feedback Analytics

Displays:

* Average Rating
* Positive Feedback %
* Negative Feedback %

---

# 19. Complaint Management

## Routes

```text
/complaints

/complaints/{id}
```

---

## Complaint List

Displays:

* Customer
* Complaint Level
* Status

---

## Complaint Details

### Sections

* Complaint Information
* Investigation Notes
* Corrective Action

---

### Actions

* Update Complaint
* Close Complaint

---

# 20. Reporting Module

## Routes

```text
/reports/dashboard

/reports/revenue

/reports/staff

/reports/customer

/reports/campaign

/reports/leads
```

---

## Revenue Report

Displays:

* Revenue Summary
* Revenue Trend
* Revenue Breakdown

---

## Staff Performance Report

Displays:

* Revenue Generated
* Services Completed
* Productivity

---

## Customer Analysis Report

Displays:

* Unique Customers
* Repeat Customers
* Lost Customers
* Membership Holders

---

## Campaign Report

Displays:

* Campaign Reach
* Campaign Response
* Conversion Rate

---

## Lead Report

Displays:

* Leads Created
* Leads Converted
* Conversion Rate

---

# 21. Common Components

## Data Table

Features:

* Search
* Sorting
* Filtering
* Pagination

---

## Modal

Used For:

* Confirmation
* Alerts
* Forms

---

## Date Picker

Used Across:

* Appointments
* Reports
* Campaigns
* Shifts

---

## Search Component

Used Across:

* Customers
* Products
* Employees
* Vendors

---

## Notification Component

Displays:

* Success Messages
* Errors
* Warnings

---

# 22. Form Validation Standards

## Required Fields

Display:

```text
This field is required.
```

---

## Email Validation

Display:

```text
Please enter a valid email address.
```

---

## Phone Validation

Display:

```text
Please enter a valid phone number.
```

---

## Numeric Validation

Display:

```text
Value must be greater than zero.
```

---

# 23. Empty States

## Example

```text
No records found.
```

---

## Actions

* Create New Record
* Refresh

---

# 24. Loading States

All data screens should provide:

* Loading Spinner
* Skeleton Loaders

---

# 25. Notifications

Display notifications for:

* Appointment Created
* Invoice Generated
* Payment Completed
* Campaign Sent
* Complaint Closed

---

# 26. Responsive Design

Supported Devices:

* Desktop
* Tablet

Minimum Resolution:

```text
1366 x 768
```

Recommended Resolution:

```text
1920 x 1080
```

---

# 27. Conclusion

The frontend provides a centralized interface for managing appointments, billing, customers, inventory, employees, campaigns, reporting, feedback, and complaints. The design prioritizes operational efficiency, ease of navigation, and quick access to business information required by salon staff and administrators.
