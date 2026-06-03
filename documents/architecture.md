# Architecture Document

# Mongo Salon POS

Version: 1.0

---

# 1. Introduction

## Purpose

This document defines the overall system architecture of Mongo Salon POS.

The objective is to provide a technical blueprint describing:

* System Components
* Module Interactions
* Data Flow
* Business Workflows
* Integration Points
* Notification Flows
* Reporting Flows

This architecture is derived from the approved Business Requirements Document (BRD).

---

# 2. System Overview

Mongo Salon POS is an integrated salon management platform designed to manage:

* Appointments
* Customer Information
* Service Delivery
* Billing
* Product Inventory
* Vendor Management
* Employee Management
* Marketing Campaigns
* Lead Tracking
* Business Intelligence
* Customer Feedback

The platform follows a centralized architecture where all modules share a common customer and business data repository.

---

# 3. High-Level Architecture

```text
+-----------------------+
|      User Interface   |
+-----------------------+
           |
           v
+-----------------------+
|    Application Layer  |
+-----------------------+
           |
           v
+-----------------------+
|     Business Layer    |
+-----------------------+
           |
           v
+-----------------------+
|      Data Layer       |
+-----------------------+
```

---

# 4. System Layers

## Presentation Layer

Responsible for:

* User Interaction
* Data Entry
* Form Validation
* Dashboard Visualization
* Report Presentation

Modules:

* Appointment Screens
* Customer Screens
* Billing Screens
* Inventory Screens
* Reporting Screens

---

## Application Layer

Responsible for:

* Request Processing
* Workflow Management
* User Actions
* Business Rule Execution

Examples:

* Appointment Creation
* Bill Generation
* Campaign Execution
* Feedback Processing

---

## Business Layer

Responsible for:

* Core Business Logic
* Validation Rules
* Workflow Execution

Examples:

* Appointment Status Updates
* Loyalty Calculations
* Membership Discounts
* Service Pricing
* Staff Allocation

---

## Data Layer

Responsible for:

* Data Storage
* Data Retrieval
* Reporting Data

Stores:

* Customers
* Appointments
* Bills
* Products
* Employees
* Campaigns
* Reports

---

# 5. Core Modules

The system consists of the following modules:

1. Appointment Management
2. Service Slip Management
3. Billing & POS
4. Customer Management
5. Employee Management
6. Product Management
7. Vendor Management
8. Expense Management
9. Service Management
10. Campaign Management
11. Lead Management
12. Business Intelligence
13. Reporting
14. Feedback Management
15. Complaint Management

---

# 6. Appointment Architecture

## Overview

Appointment Management serves as the entry point for customer services.

Appointments may originate from:

* Walk-In
* Website
* Google Business
* Phone
* Facebook
* Mobile App (Future)

---

## Appointment Flow

```text
Customer Contact
        |
        v
Phone Number Lookup
        |
        |
   +----+----+
   |         |
Existing   New
Customer  Customer
   |         |
   +----+----+
        |
        v
Service Selection
        |
        v
Staff Selection
        |
        v
Appointment Creation
        |
        v
Notification Delivery
```

---

## Appointment Status Flow

```text
Booked
   |
   v
Checked-In
   |
   v
In-Service
   |
   v
Check-Out
   |
   v
Billed
```

Alternative paths:

```text
Booked
  |
  +----> Cancelled

Booked
  |
  +----> No Show
```

---

# 7. Service Slip Architecture

## Purpose

The service slip acts as the operational document used during service execution.

---

## Service Slip Flow

```text
Appointment
      |
      v
Service Selection
      |
      v
Staff Assignment
      |
      v
Service Slip Generation
      |
      v
Service Execution
      |
      v
Billing
```

---

## Service Slip Components

### Services

Contains:

* Service Name
* Price
* Tax

### Staff

Contains:

* Assigned Staff
* Service Duration

### Timing

Contains:

* Start Time
* End Time

---

# 8. Billing Architecture

## Purpose

The billing module handles customer invoicing and payment processing.

---

## Billing Flow

```text
Service Completion
       |
       v
Check-Out
       |
       v
Generate Bill
       |
       v
Apply Discounts
       |
       v
Apply Loyalty Redemption
       |
       v
Select Payment Method
       |
       v
Invoice Generation
       |
       v
Notification Delivery
```

---

## Payment Methods

* Cash
* Credit Card
* Debit Card
* Google Pay
* PhonePe
* PayTM
* Bank Transfer
* Family Card
* Prepaid Card
* Gift Card
* Voucher

---

## Prepaid Card Validation

```text
Prepaid Payment
       |
       v
Generate OTP
       |
       v
Customer Verification
       |
       v
Deduct Balance
       |
       v
Complete Payment
```

---

# 9. Customer Management Architecture

## Purpose

Maintain complete customer information.

---

## Customer Lifecycle

```text
Lead
  |
  v
Customer
  |
  v
Appointment
  |
  v
Service
  |
  v
Billing
  |
  v
Feedback
```

---

## Customer Data Areas

### Personal Information

* Name
* Gender
* Date of Birth
* Anniversary

### Contact Information

* Phone
* Email

### Loyalty Information

* Points
* Membership
* Prepaid Cards

### Service Information

* Visits
* Preferences
* Favorite Staff

---

# 10. Employee Management Architecture

## Purpose

Maintain employee records and availability.

---

## Employee Workflow

```text
Employee Creation
        |
        v
Skill Assignment
        |
        v
Shift Assignment
        |
        v
Appointment Allocation
        |
        v
Performance Measurement
```

---

## Employee States

```text
Active
Inactive
Exited
```

---

# 11. Product Management Architecture

## Product Types

### In-Salon Products

Used during service execution.

Examples:

* Hair Color
* Shampoo
* Cream

---

### Retail Products

Sold directly to customers.

Examples:

* Hair Serum
* Face Wash
* Shampoo Bottle

---

## Product Consumption Flow

```text
Product Purchase
       |
       v
Inventory Entry
       |
       v
Service Usage
       |
       v
Inventory Reduction
```

---

# 12. Vendor Management Architecture

## Vendor Workflow

```text
Vendor Creation
      |
      v
Purchase Order
      |
      v
Product Delivery
      |
      v
Invoice Recording
      |
      v
Payment Processing
```

---

# 13. Expense Management Architecture

## Expense Flow

```text
Expense Occurs
      |
      v
Voucher Generation
      |
      v
Approval
      |
      v
Day Book Entry
```

---

## Day Book Flow

```text
Opening Cash
      +
Cash Sales
      -
Cash Expenses
      =
Closing Cash
```

---

# 14. Service Management Architecture

## Service Configuration

Each service contains:

* Category
* Duration
* Price
* Products Used

---

## Service Categories

* Hair Services
* Skin Services
* Spa Services
* Make-Over Services
* Treatments

---

# 15. Campaign Management Architecture

## Purpose

Automated customer communication.

---

## Campaign Types

* SMS
* Email
* WhatsApp

---

## Campaign Workflow

```text
Rule Creation
      |
      v
Customer Selection
      |
      v
Message Generation
      |
      v
Delivery
      |
      v
Campaign Tracking
```

---

## Example Rule

```text
Last Haircut = 30 Days
        |
        v
Send Reminder SMS
```

---

# 16. Lead Management Architecture

## Lead Sources

* Website
* Facebook
* Google

---

## Lead Lifecycle

```text
New Lead
    |
    v
Prospective
    |
    v
Follow-Up
    |
    v
Converted
```

Alternative:

```text
New Lead
    |
    v
Cold
```

---

## Lead Follow-Up Methods

* Phone
* SMS
* WhatsApp
* Email

---

# 17. Feedback Architecture

## Feedback Collection Flow

```text
Invoice Generated
       |
       v
Feedback Link Sent
       |
       v
Customer Response
```

---

## Positive Feedback

```text
Positive Feedback
       |
       v
Google Review
       |
       v
Facebook Review
```

---

## Negative Feedback

```text
Negative Feedback
        |
        v
Questionnaire
        |
        v
Administrative Alert
        |
        v
Complaint Creation
```

---

# 18. Complaint Management Architecture

## Complaint Levels

### Level 1

Reputational Loss

### Level 2

Revenue Loss

### Level 3

Minor Operational Issue

---

## Complaint Flow

```text
Complaint Raised
        |
        v
Classification
        |
        v
Investigation
        |
        v
Corrective Action
        |
        v
Closure
```

---

# 19. Reporting Architecture

## Data Sources

Reports consume data from:

* Appointments
* Service Slips
* Invoices
* Customers
* Employees
* Campaigns
* Leads
* Feedback

---

## Report Categories

### Operational Reports

* Appointments
* Walk-Ins
* Cancellations

### Revenue Reports

* Daily Revenue
* Weekly Revenue
* Monthly Revenue

### Staff Reports

* Productivity
* Sales
* Service Performance

### Customer Reports

* Retention
* Segmentation
* Loyalty

---

# 20. Business Intelligence Architecture

## Dashboard Components

### Revenue Metrics

* Revenue
* Average Bill Value

### Customer Metrics

* Repeat Customers
* Retention Rate

### Staff Metrics

* Staff Productivity
* Service Revenue

### Marketing Metrics

* Campaign Success
* Lead Conversion

---

# 21. Notification Architecture

## Supported Channels

* SMS
* Email

---

## Notification Events

### Appointment

* Confirmation
* Reminder

### Billing

* Invoice Delivery

### Customer Engagement

* Feedback Request
* Referral Request

### Campaigns

* Promotional Messages

---

# 22. Integration Points

The system integrates with:

### SMS Provider

For:

* Appointment Confirmation
* Reminders
* Campaigns

### Email Provider

For:

* Appointment Confirmation
* Invoice Delivery
* Campaigns

### Social Platforms

For:

* Google Reviews
* Facebook Reviews

---

# 23. Security Considerations

The system shall:

* Restrict administrative actions to authorized users.
* Protect customer information.
* Maintain billing integrity.
* Secure payment-related transactions.
* Secure OTP verification workflows.

---

# 24. Conclusion

Mongo Salon POS is designed as a centralized salon management platform that manages the complete operational workflow from customer acquisition through service delivery, billing, customer feedback, and business analysis.

The architecture ensures all modules remain connected through shared business data while supporting operational efficiency, customer engagement, and business growth.
