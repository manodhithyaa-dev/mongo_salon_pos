# API Documentation

# Mongo Salon POS

Version: 1.0

---

# 1. Introduction

## Purpose

This document defines the REST API contract for Mongo Salon POS.

The API supports:

* Appointment Management
* Service Slip Management
* Billing & POS
* Customer Management
* Employee Management
* Product Management
* Vendor Management
* Expense Management
* Service Management
* Campaign Management
* Lead Management
* Reporting
* Feedback Management
* Complaint Management

---

# 2. API Standards

## Base URL

```http
/api/v1
```

---

## Request Format

```json
{
  "data": {}
}
```

---

## Success Response

```json
{
  "success": true,
  "message": "Operation successful",
  "data": {}
}
```

---

## Error Response

```json
{
  "success": false,
  "message": "Validation failed",
  "errors": []
}
```

---

## HTTP Status Codes

| Code | Meaning               |
| ---- | --------------------- |
| 200  | Success               |
| 201  | Created               |
| 400  | Bad Request           |
| 401  | Unauthorized          |
| 403  | Forbidden             |
| 404  | Not Found             |
| 409  | Conflict              |
| 422  | Validation Error      |
| 500  | Internal Server Error |

---

# 3. Authentication APIs

## Login

```http
POST /auth/login
```

### Request

```json
{
  "username": "admin",
  "password": "password"
}
```

### Response

```json
{
  "token": "jwt_token",
  "user": {}
}
```

---

## Logout

```http
POST /auth/logout
```

---

## Change Password

```http
POST /auth/change-password
```

---

# 4. Customer APIs

## Get Customers

```http
GET /customers
```

### Query Parameters

```text
page
limit
search
```

---

## Get Customer

```http
GET /customers/{id}
```

---

## Search Customer By Phone

```http
GET /customers/search/phone/{phoneNumber}
```

### Purpose

Used during appointment creation.

---

## Create Customer

```http
POST /customers
```

### Request

```json
{
  "fullName": "John Doe",
  "phone": "9876543210",
  "email": "john@example.com"
}
```

---

## Update Customer

```http
PUT /customers/{id}
```

---

## Delete Customer

```http
DELETE /customers/{id}
```

---

## Customer Visit History

```http
GET /customers/{id}/visits
```

---

## Customer Feedback History

```http
GET /customers/{id}/feedback
```

---

## Customer Loyalty Summary

```http
GET /customers/{id}/loyalty
```

---

# 5. Membership APIs

## Create Membership

```http
POST /memberships
```

---

## Get Memberships

```http
GET /memberships
```

---

## Get Membership

```http
GET /memberships/{id}
```

---

## Update Membership

```http
PUT /memberships/{id}
```

---

## Cancel Membership

```http
PATCH /memberships/{id}/cancel
```

---

# 6. Prepaid Card APIs

## Create Prepaid Card

```http
POST /prepaid-cards
```

---

## Get Prepaid Card

```http
GET /prepaid-cards/{id}
```

---

## Get Balance

```http
GET /prepaid-cards/{id}/balance
```

---

## Recharge Card

```http
POST /prepaid-cards/{id}/recharge
```

---

## Generate OTP

```http
POST /prepaid-cards/{id}/otp
```

---

## Verify OTP

```http
POST /prepaid-cards/{id}/verify-otp
```

---

# 7. Appointment APIs

## Get Appointments

```http
GET /appointments
```

### Filters

```text
date
status
customer
staff
source
```

---

## Get Appointment

```http
GET /appointments/{id}
```

---

## Create Appointment

```http
POST /appointments
```

### Request

```json
{
  "customerId": "id",
  "source": "PHONE",
  "appointmentDate": "2026-06-01",
  "services": []
}
```

---

## Update Appointment

```http
PUT /appointments/{id}
```

---

## Cancel Appointment

```http
PATCH /appointments/{id}/cancel
```

---

## No Show

```http
PATCH /appointments/{id}/no-show
```

---

## Check-In

```http
PATCH /appointments/{id}/check-in
```

---

## Start Service

```http
PATCH /appointments/{id}/in-service
```

---

## Check-Out

```http
PATCH /appointments/{id}/check-out
```

---

## Mark Billed

```http
PATCH /appointments/{id}/billed
```

---

## Appointment Calendar

```http
GET /appointments/calendar
```

---

## Available Staff

```http
GET /appointments/available-staff
```

### Query

```text
date
startTime
endTime
```

---

# 8. Appointment Service APIs

## Add Service

```http
POST /appointments/{id}/services
```

---

## Update Service

```http
PUT /appointments/{id}/services/{serviceId}
```

---

## Remove Service

```http
DELETE /appointments/{id}/services/{serviceId}
```

---

# 9. Service Slip APIs

## Create Service Slip

```http
POST /service-slips
```

---

## Get Service Slip

```http
GET /service-slips/{id}
```

---

## Update Service Slip

```http
PUT /service-slips/{id}
```

---

## Regenerate Service Slip

```http
POST /service-slips/{id}/regenerate
```

---

## Add Service

```http
POST /service-slips/{id}/services
```

---

## Remove Service

```http
DELETE /service-slips/{id}/services/{serviceId}
```

---

# 10. Billing APIs

## Create Invoice

```http
POST /invoices
```

---

## Get Invoices

```http
GET /invoices
```

---

## Get Invoice

```http
GET /invoices/{id}
```

---

## Add Service

```http
POST /invoices/{id}/services
```

---

## Add Product

```http
POST /invoices/{id}/products
```

---

## Apply Discount

```http
PATCH /invoices/{id}/discount
```

---

## Redeem Loyalty Points

```http
PATCH /invoices/{id}/redeem-loyalty
```

---

## Finalize Invoice

```http
POST /invoices/{id}/finalize
```

---

## Print Invoice

```http
GET /invoices/{id}/print
```

---

## Email Invoice

```http
POST /invoices/{id}/email
```

---

## SMS Invoice

```http
POST /invoices/{id}/sms
```

---

# 11. Payment APIs

## Create Payment

```http
POST /payments
```

### Request

```json
{
  "invoiceId": "id",
  "paymentMethod": "CASH",
  "amount": 1000
}
```

---

## Get Payment

```http
GET /payments/{id}
```

---

## Payment History

```http
GET /payments
```

---

# 12. Product APIs

## Get Products

```http
GET /products
```

---

## Create Product

```http
POST /products
```

---

## Update Product

```http
PUT /products/{id}
```

---

## Delete Product

```http
DELETE /products/{id}
```

---

## Product Stock

```http
GET /products/{id}/stock
```

---

## Inventory History

```http
GET /products/{id}/transactions
```

---

# 13. Vendor APIs

## Get Vendors

```http
GET /vendors
```

---

## Create Vendor

```http
POST /vendors
```

---

## Update Vendor

```http
PUT /vendors/{id}
```

---

## Delete Vendor

```http
DELETE /vendors/{id}
```

---

## Vendor Invoices

```http
GET /vendors/{id}/invoices
```

---

# 14. Purchase Order APIs

## Create Purchase Order

```http
POST /purchase-orders
```

---

## Get Purchase Orders

```http
GET /purchase-orders
```

---

## Get Purchase Order

```http
GET /purchase-orders/{id}
```

---

## Send Purchase Order

```http
POST /purchase-orders/{id}/send
```

---

## Receive Purchase Order

```http
PATCH /purchase-orders/{id}/receive
```

---

# 15. Employee APIs

## Get Employees

```http
GET /employees
```

---

## Create Employee

```http
POST /employees
```

---

## Update Employee

```http
PUT /employees/{id}
```

---

## Delete Employee

```http
DELETE /employees/{id}
```

---

## Employee Skills

```http
GET /employees/{id}/skills
```

---

## Update Skills

```http
PUT /employees/{id}/skills
```

---

# 16. Shift APIs

## Get Shifts

```http
GET /shifts
```

---

## Create Shift

```http
POST /shifts
```

---

## Update Shift

```http
PUT /shifts/{id}
```

---

## Delete Shift

```http
DELETE /shifts/{id}
```

---

# 17. Service Management APIs

## Get Services

```http
GET /services
```

---

## Create Service

```http
POST /services
```

---

## Update Service

```http
PUT /services/{id}
```

---

## Delete Service

```http
DELETE /services/{id}
```

---

## Service Categories

```http
GET /service-categories
```

---

## Create Category

```http
POST /service-categories
```

---

# 18. Expense APIs

## Get Expenses

```http
GET /expenses
```

---

## Create Expense

```http
POST /expenses
```

---

## Update Expense

```http
PUT /expenses/{id}
```

---

## Delete Expense

```http
DELETE /expenses/{id}
```

---

## Day Book

```http
GET /day-book
```

---

## Close Day

```http
POST /day-book/close
```

---

# 19. Campaign APIs

## Get Campaigns

```http
GET /campaigns
```

---

## Create Campaign

```http
POST /campaigns
```

---

## Update Campaign

```http
PUT /campaigns/{id}
```

---

## Delete Campaign

```http
DELETE /campaigns/{id}
```

---

## Activate Campaign

```http
PATCH /campaigns/{id}/activate
```

---

## Deactivate Campaign

```http
PATCH /campaigns/{id}/deactivate
```

---

## Run Campaign

```http
POST /campaigns/{id}/run
```

---

# 20. Lead APIs

## Get Leads

```http
GET /leads
```

---

## Create Lead

```http
POST /leads
```

---

## Update Lead

```http
PUT /leads/{id}
```

---

## Convert Lead

```http
POST /leads/{id}/convert
```

### Result

Creates customer record.

---

## Add Follow-Up

```http
POST /leads/{id}/follow-up
```

---

# 21. Feedback APIs

## Get Feedback

```http
GET /feedback
```

---

## Submit Feedback

```http
POST /feedback
```

---

## Feedback Statistics

```http
GET /feedback/statistics
```

---

# 22. Complaint APIs

## Get Complaints

```http
GET /complaints
```

---

## Create Complaint

```http
POST /complaints
```

---

## Update Complaint

```http
PUT /complaints/{id}
```

---

## Close Complaint

```http
PATCH /complaints/{id}/close
```

---

## Complaint Statistics

```http
GET /complaints/statistics
```

---

# 23. Dashboard APIs

## Dashboard Summary

```http
GET /dashboard
```

### Returns

* Revenue
* Appointments
* Walk-Ins
* Cancellations
* Customer Metrics

---

# 24. Reporting APIs

## Revenue Report

```http
GET /reports/revenue
```

---

## Staff Performance Report

```http
GET /reports/staff-performance
```

---

## Customer Analysis Report

```http
GET /reports/customer-analysis
```

---

## Appointment Report

```http
GET /reports/appointments
```

---

## Lead Conversion Report

```http
GET /reports/lead-conversion
```

---

## Campaign Performance Report

```http
GET /reports/campaign-performance
```

---

## Customer Retention Report

```http
GET /reports/customer-retention
```

---

# 25. Notification APIs

## Send SMS

```http
POST /notifications/sms
```

---

## Send Email

```http
POST /notifications/email
```

---

## Notification Logs

```http
GET /notifications/logs
```

---

# 26. Validation Rules

## Customer

* Phone Number Required
* Phone Number Unique

---

## Appointment

* Customer Required
* At Least One Service Required
* Staff Cannot Be Double Booked

---

## Invoice

* At Least One Item Required
* Total Amount Must Be Greater Than Zero

---

## Payment

* Payment Amount Must Be Positive
* Prepaid Card Requires OTP Verification

---

# 27. Business Rules

## Appointment Rules

* Staff availability determined from shifts.
* Double booking is not allowed.
* Appointment reminders must be supported.

---

## Billing Rules

* Membership discounts apply automatically.
* Loyalty points can be redeemed.
* Multiple payment methods allowed.

---

## Campaign Rules

* Campaigns may be active or inactive.
* Rules determine recipient selection.

---

## Complaint Rules

* All complaints must be closed.
* Corrective action must be recorded before closure.

---

# 28. Conclusion

This API specification provides the contract required to implement all business processes defined in the Mongo Salon POS BRD, including appointments, billing, inventory, CRM, campaigns, reporting, feedback, and complaint management.
