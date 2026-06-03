# Database Design Document

# Mongo Salon POS

Version: 1.0

---

# 1. Introduction

## Purpose

This document defines the database structure required to support the Mongo Salon POS platform.

The design is derived from the approved BRD and supports:

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
* Feedback Management
* Complaint Management
* Reporting

---

# 2. Entity Relationship Overview

```text
Customers
    |
    +---- Appointments
                |
                +---- Service Slips
                            |
                            +---- Invoices
                                        |
                                        +---- Payments

Customers
    |
    +---- Feedback
    |
    +---- Complaints

Employees
    |
    +---- Shifts
    |
    +---- Appointments

Services
    |
    +---- Service Products

Products
    |
    +---- Inventory Transactions
    |
    +---- Vendors

Campaigns
    |
    +---- Leads
```

---

# 3. Customers

## Collection: customers

### Purpose

Stores all customer information.

### Fields

| Field            | Type     |
| ---------------- | -------- |
| _id              | ObjectId |
| customerCode     | String   |
| fullName         | String   |
| gender           | String   |
| phone            | String   |
| whatsappNumber   | String   |
| email            | String   |
| dateOfBirth      | Date     |
| anniversaryDate  | Date     |
| photo            | String   |
| address          | String   |
| membershipId     | ObjectId |
| prepaidCardId    | ObjectId |
| totalVisits      | Number   |
| averageBillValue | Number   |
| firstVisitDate   | Date     |
| lastVisitDate    | Date     |
| totalSpend       | Number   |
| notes            | String   |
| createdAt        | Date     |
| updatedAt        | Date     |

### Indexes

```javascript
phone
email
membershipId
```

### Business Rules

* Phone number must be unique.
* Phone number acts as primary lookup key.
* Customer metrics update automatically after billing.

---

# 4. Memberships

## Collection: memberships

### Fields

| Field              | Type     |
| ------------------ | -------- |
| _id                | ObjectId |
| membershipNumber   | String   |
| customerId         | ObjectId |
| membershipName     | String   |
| discountPercentage | Number   |
| startDate          | Date     |
| endDate            | Date     |
| status             | String   |

### Status

```text
ACTIVE
EXPIRED
CANCELLED
```

---

# 5. Prepaid Cards

## Collection: prepaid_cards

### Fields

| Field      | Type     |
| ---------- | -------- |
| _id        | ObjectId |
| cardNumber | String   |
| customerId | ObjectId |
| balance    | Number   |
| issuedDate | Date     |
| expiryDate | Date     |
| status     | String   |

### Business Rules

* Requires OTP validation before payment deduction.

---

# 6. Gift Cards

## Collection: gift_cards

### Fields

| Field      | Type     |
| ---------- | -------- |
| _id        | ObjectId |
| cardNumber | String   |
| amount     | Number   |
| issuedTo   | ObjectId |
| expiryDate | Date     |
| status     | String   |

---

# 7. Loyalty Points

## Collection: loyalty_transactions

### Fields

| Field           | Type     |
| --------------- | -------- |
| _id             | ObjectId |
| customerId      | ObjectId |
| transactionType | String   |
| points          | Number   |
| referenceType   | String   |
| referenceId     | ObjectId |
| createdAt       | Date     |

### Transaction Types

```text
EARN
REDEEM
ADJUSTMENT
```

---

# 8. Services

## Collection: services

### Fields

| Field           | Type     |
| --------------- | -------- |
| _id             | ObjectId |
| serviceCode     | String   |
| categoryId      | ObjectId |
| serviceName     | String   |
| durationMinutes | Number   |
| sellingPrice    | Number   |
| description     | String   |
| status          | String   |
| createdAt       | Date     |

### Business Rules

* Duration mandatory.
* Price mandatory.
* Service may use multiple products.

---

# 9. Service Categories

## Collection: service_categories

### Fields

| Field        | Type     |
| ------------ | -------- |
| _id          | ObjectId |
| categoryName | String   |
| description  | String   |

### Categories

```text
Hair Services
Skin Services
Spa Services
Makeover Services
Treatments
```

---

# 10. Service Products

## Collection: service_products

### Purpose

Maps products used by services.

### Fields

| Field            | Type     |
| ---------------- | -------- |
| _id              | ObjectId |
| serviceId        | ObjectId |
| productId        | ObjectId |
| quantityRequired | Number   |

---

# 11. Employees

## Collection: employees

### Fields

| Field            | Type     |
| ---------------- | -------- |
| _id              | ObjectId |
| fullName         | String   |
| permanentAddress | String   |
| localAddress     | String   |
| phoneNumber      | String   |
| alternateNumber  | String   |
| photo            | String   |
| emergencyContact | String   |
| dateOfBirth      | Date     |
| idCardScan       | String   |
| designation      | String   |
| salary           | Number   |
| notes            | String   |
| dateOfJoining    | Date     |
| status           | String   |

### Status

```text
ACTIVE
INACTIVE
EXITED
```

---

# 12. Employee Skills

## Collection: employee_skills

| Field      | Type     |
| ---------- | -------- |
| _id        | ObjectId |
| employeeId | ObjectId |
| skillName  | String   |

---

# 13. Employee Shifts

## Collection: employee_shifts

### Fields

| Field      | Type     |
| ---------- | -------- |
| _id        | ObjectId |
| employeeId | ObjectId |
| shiftDate  | Date     |
| startTime  | Date     |
| endTime    | Date     |
| status     | String   |

### Business Rules

* Appointment staff availability derives from shifts.

---

# 14. Appointments

## Collection: appointments

### Fields

| Field             | Type     |
| ----------------- | -------- |
| _id               | ObjectId |
| appointmentNumber | String   |
| customerId        | ObjectId |
| source            | String   |
| appointmentDate   | Date     |
| startTime         | Date     |
| endTime           | Date     |
| status            | String   |
| remarks           | String   |
| createdAt         | Date     |

### Sources

```text
WALK_IN
WEBSITE
GOOGLE
PHONE
FACEBOOK
MOBILE_APP
```

### Status

```text
BOOKED
CHECKED_IN
IN_SERVICE
CHECK_OUT
BILLED
NO_SHOW
CANCELLED
```

---

# 15. Appointment Services

## Collection: appointment_services

### Fields

| Field         | Type     |
| ------------- | -------- |
| _id           | ObjectId |
| appointmentId | ObjectId |
| serviceId     | ObjectId |
| employeeId    | ObjectId |
| startTime     | Date     |
| endTime       | Date     |
| price         | Number   |

---

# 16. Service Slips

## Collection: service_slips

### Fields

| Field         | Type     |
| ------------- | -------- |
| _id           | ObjectId |
| slipNumber    | String   |
| appointmentId | ObjectId |
| customerId    | ObjectId |
| totalAmount   | Number   |
| taxAmount     | Number   |
| generatedAt   | Date     |

---

# 17. Service Slip Items

## Collection: service_slip_items

### Fields

| Field         | Type     |
| ------------- | -------- |
| _id           | ObjectId |
| serviceSlipId | ObjectId |
| serviceId     | ObjectId |
| employeeId    | ObjectId |
| servicePrice  | Number   |
| startTime     | Date     |
| endTime       | Date     |

---

# 18. Products

## Collection: products

### Fields

| Field                | Type     |
| -------------------- | -------- |
| _id                  | ObjectId |
| productCode          | String   |
| productName          | String   |
| productType          | String   |
| vendorId             | ObjectId |
| minimumOrderQuantity | Number   |
| currentStock         | Number   |
| unitPrice            | Number   |
| status               | String   |

### Product Types

```text
IN_SALON
RETAIL
```

---

# 19. Inventory Transactions

## Collection: inventory_transactions

### Fields

| Field           | Type     |
| --------------- | -------- |
| _id             | ObjectId |
| productId       | ObjectId |
| transactionType | String   |
| quantity        | Number   |
| referenceId     | ObjectId |
| transactionDate | Date     |

### Types

```text
PURCHASE
SERVICE_USAGE
SALE
ADJUSTMENT
```

---

# 20. Vendors

## Collection: vendors

### Fields

| Field                  | Type     |
| ---------------------- | -------- |
| _id                    | ObjectId |
| vendorName             | String   |
| vendorPhone            | String   |
| primaryContactPerson   | String   |
| secondaryContactPerson | String   |
| vendorAddress          | String   |
| vendorGSTNumber        | String   |

---

# 21. Purchase Orders

## Collection: purchase_orders

### Fields

| Field       | Type     |
| ----------- | -------- |
| _id         | ObjectId |
| poNumber    | String   |
| vendorId    | ObjectId |
| orderDate   | Date     |
| totalAmount | Number   |
| status      | String   |

### Status

```text
DRAFT
SENT
PARTIALLY_RECEIVED
COMPLETED
CANCELLED
```

---

# 22. Invoices

## Collection: invoices

### Fields

| Field          | Type     |
| -------------- | -------- |
| _id            | ObjectId |
| invoiceNumber  | String   |
| customerId     | ObjectId |
| serviceSlipId  | ObjectId |
| subtotal       | Number   |
| discountAmount | Number   |
| taxAmount      | Number   |
| totalAmount    | Number   |
| invoiceDate    | Date     |

---

# 23. Invoice Items

## Collection: invoice_items

### Fields

| Field     | Type     |
| --------- | -------- |
| _id       | ObjectId |
| invoiceId | ObjectId |
| itemType  | String   |
| itemId    | ObjectId |
| quantity  | Number   |
| price     | Number   |

### Item Types

```text
SERVICE
PRODUCT
```

---

# 24. Payments

## Collection: payments

### Fields

| Field                | Type     |
| -------------------- | -------- |
| _id                  | ObjectId |
| invoiceId            | ObjectId |
| paymentMethod        | String   |
| amount               | Number   |
| transactionReference | String   |
| paymentDate          | Date     |

---

# 25. Expenses

## Collection: expenses

### Fields

| Field           | Type     |
| --------------- | -------- |
| _id             | ObjectId |
| expenseCategory | String   |
| description     | String   |
| amount          | Number   |
| authorizedBy    | String   |
| paymentMethod   | String   |
| expenseDate     | Date     |

---

# 26. Day Book

## Collection: day_book

### Fields

| Field        | Type     |
| ------------ | -------- |
| _id          | ObjectId |
| businessDate | Date     |
| openingCash  | Number   |
| cashSales    | Number   |
| cashExpenses | Number   |
| closingCash  | Number   |

---

# 27. Campaigns

## Collection: campaigns

### Fields

| Field           | Type     |
| --------------- | -------- |
| _id             | ObjectId |
| campaignName    | String   |
| campaignType    | String   |
| status          | String   |
| messageTemplate | String   |

### Types

```text
SMS
EMAIL
WHATSAPP
```

---

# 28. Campaign Rules

## Collection: campaign_rules

### Fields

| Field       | Type     |
| ----------- | -------- |
| _id         | ObjectId |
| campaignId  | ObjectId |
| criteria    | Object   |
| repeatCount | Number   |
| active      | Boolean  |

---

# 29. Leads

## Collection: leads

### Fields

| Field            | Type     |
| ---------------- | -------- |
| _id              | ObjectId |
| fullName         | String   |
| phoneNumber      | String   |
| email            | String   |
| requestedService | String   |
| followUpDate     | Date     |
| followUpNotes    | String   |
| status           | String   |

### Status

```text
NEW
PROSPECTIVE
FOLLOW_UP
COLD
CONVERTED
```

---

# 30. Feedback

## Collection: feedback

### Fields

| Field       | Type     |
| ----------- | -------- |
| _id         | ObjectId |
| customerId  | ObjectId |
| employeeId  | ObjectId |
| invoiceId   | ObjectId |
| rating      | Number   |
| comments    | String   |
| submittedAt | Date     |

---

# 31. Complaints

## Collection: complaints

### Fields

| Field                | Type     |
| -------------------- | -------- |
| _id                  | ObjectId |
| customerId           | ObjectId |
| complaintLevel       | Number   |
| complaintDescription | String   |
| correctiveAction     | String   |
| status               | String   |
| closedAt             | Date     |

### Levels

```text
1 = Reputational Loss
2 = Revenue Loss
3 = Minor Issue
```

---

# 32. Notification Logs

## Collection: notification_logs

### Fields

| Field          | Type     |
| -------------- | -------- |
| _id            | ObjectId |
| customerId     | ObjectId |
| channel        | String   |
| messageType    | String   |
| deliveryStatus | String   |
| sentAt         | Date     |

---

# 33. Common Fields Standard

All collections should include:

```javascript
createdAt
updatedAt
createdBy
updatedBy
```

---

# 34. Reporting Strategy

Reports should derive data from:

* Appointments
* Service Slips
* Invoices
* Customers
* Employees
* Campaigns
* Leads
* Feedback
* Complaints

No separate reporting database is required in the current BRD.

---

# 35. Conclusion

This database design provides the foundation for all business workflows defined in the BRD, including appointment management, billing, inventory control, employee management, customer engagement, reporting, and complaint handling.
