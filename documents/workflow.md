# Workflow Document

# Mongo Salon POS

Version: 1.0

---

# 1. Purpose

This document defines all business workflows and state transitions within Mongo Salon POS.

---

# 2. Customer Lifecycle

```text
Lead
 ↓
Customer Created
 ↓
Appointment Booked
 ↓
Service Delivered
 ↓
Invoice Generated
 ↓
Feedback Submitted
 ↓
Retention Campaign
```

---

# 3. Appointment Workflow

## Sources

* Walk-In
* Website
* Google Business
* Phone
* Facebook
* Mobile App (Future)

---

## Booking Flow

```text
Customer Search
      ↓
Existing Customer ?
      ↓
Yes ------------ No
 ↓                ↓
Load Data    Create Customer
      ↓
Select Services
      ↓
Select Staff
      ↓
Choose Time Slot
      ↓
Create Appointment
      ↓
Send Confirmation
```

---

## Appointment State Machine

```text
BOOKED
   ↓
CHECKED_IN
   ↓
IN_SERVICE
   ↓
CHECK_OUT
   ↓
BILLED
```

Alternative paths:

```text
BOOKED → CANCELLED

BOOKED → NO_SHOW
```

---

# 4. Service Slip Workflow

```text
Appointment Created
       ↓
Generate Service Slip
       ↓
Assign Staff
       ↓
Track Service Duration
       ↓
Modify Services (Optional)
       ↓
Regenerate Slip
       ↓
Service Completed
```

---

# 5. Billing Workflow

```text
Check-Out
     ↓
Load Service Slip
     ↓
Add Products
     ↓
Apply Discounts
     ↓
Redeem Loyalty
     ↓
Choose Payment Method
     ↓
Generate Invoice
     ↓
Send Receipt
```

---

## Payment Workflow

```text
Invoice
   ↓
Payment Method Selection
   ↓
Payment Recorded
   ↓
Invoice Closed
```

---

## Prepaid Card Flow

```text
Select Prepaid Card
        ↓
Generate OTP
        ↓
Verify OTP
        ↓
Deduct Balance
        ↓
Complete Payment
```

---

# 6. Product Inventory Workflow

```text
Vendor Purchase
       ↓
Stock Received
       ↓
Inventory Updated
       ↓
Product Usage
       ↓
Inventory Reduced
```

---

## Retail Product Sale

```text
Product Added To Bill
         ↓
Invoice Generated
         ↓
Inventory Reduced
```

---

# 7. Vendor Workflow

```text
Vendor Created
      ↓
Purchase Order
      ↓
PO Sent
      ↓
Products Received
      ↓
Vendor Invoice Recorded
      ↓
Vendor Payment
```

---

# 8. Employee Workflow

```text
Employee Added
      ↓
Skills Assigned
      ↓
Shift Assigned
      ↓
Appointment Assigned
      ↓
Performance Measured
```

---

# 9. Shift Workflow

```text
Create Shift
      ↓
Assign Employee
      ↓
Available For Booking
      ↓
Unavailable Outside Shift
```

---

# 10. Campaign Workflow

```text
Create Campaign
       ↓
Define Rule
       ↓
Activate Campaign
       ↓
Customer Matching
       ↓
Send Messages
       ↓
Track Results
```

---

# 11. Lead Workflow

```text
New Lead
    ↓
Prospective
    ↓
Follow-Up
    ↓
Converted
```

Alternative:

```text
New Lead
   ↓
Cold
```

---

## Lead Conversion Workflow

```text
Lead
 ↓
Convert
 ↓
Customer Created
 ↓
Appointment
```

---

# 12. Feedback Workflow

```text
Invoice Generated
       ↓
Feedback Link Sent
       ↓
Customer Response
```

---

## Positive Feedback

```text
Positive Feedback
       ↓
Google Review
       ↓
Facebook Review
```

---

## Negative Feedback

```text
Negative Feedback
        ↓
Questionnaire
        ↓
Complaint Created
```

---

# 13. Complaint Workflow

```text
Complaint Created
        ↓
Categorize
        ↓
Investigate
        ↓
Corrective Action
        ↓
Close Complaint
```

---

## Complaint Levels

### Level 1

Reputational Loss

### Level 2

Revenue Loss

### Level 3

Minor Operational Issue

---

# 14. Expense Workflow

```text
Expense Occurs
      ↓
Expense Voucher
      ↓
Approval
      ↓
Day Book Entry
```

---

# 15. Day Book Workflow

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

# 16. Reporting Workflow

```text
Business Data
      ↓
Aggregation
      ↓
Report Generation
      ↓
Dashboard
      ↓
Email Distribution
```

---

# 17. Notification Workflow

## Appointment

```text
Appointment Created
       ↓
SMS Sent
       ↓
Email Sent
```

---

## Reminder

```text
Appointment Near
       ↓
Reminder Trigger
       ↓
SMS
       ↓
Email
```

---

## Billing

```text
Invoice Generated
       ↓
SMS Receipt
       ↓
Email Invoice
```

---

# 18. End-to-End Salon Workflow

```text
Lead
 ↓
Customer
 ↓
Appointment
 ↓
Service Slip
 ↓
Service Delivery
 ↓
Billing
 ↓
Feedback
 ↓
Retention Campaign
 ↓
Repeat Customer
```

---

# Conclusion

This workflow document defines all operational state transitions and business processes used throughout Mongo Salon POS.
