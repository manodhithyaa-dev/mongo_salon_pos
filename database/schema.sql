create database mongo_salon;
use mongo_salon;

create table owners (
	owner_id int primary key auto_increment,
	name varchar(30) not null,
    user_email varchar(60) unique not null,
    user_phone varchar(20) unique not null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default(null)
);

create table branches (
	owner_id int not null,
	branch_id int primary key auto_increment,
	branch_name varchar(30) not null,
	phone varchar(30) not null,
	email varchar(30) not null,
	address varchar(30) not null,
	city varchar(30) not null,
	state varchar(30) not null,
	pincode int not null,
	opening_time datetime not null,
	closing_time datetime not null,
	status bool not null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default(null),
    
    foreign key (owner_id) references owners (owner_id)
);

create table staff (
	staff_id int primary key auto_increment,
    employee_code varchar(20) not null,
    name varchar(30) not null,
    phone varchar(30) not null,
    email varchar(30) unique not null,
    salary int not null,
    branch_id int not null,
    permanent_address varchar(30) not null,
	local_address varchar(30) not null,
    emergency_contact varchar(30) not null,
    dob datetime,
    designation varchar(20) not null,
    salary int not null,
    joining_date datetime default current_timestamp,
    notes varchar(100),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null,
    
    constraint chk_staff_salary check (salary >= 0),
    constraint chk_unique_phone unique (phone),
    constraint chk_unique_email unique (email),
    constraint chk_unique_emp_code unique (employee_code),
    foreign key (branch_id) references branches (branch_id)
);

create table staff_schedule (
	schedule_id int primary key auto_increment,
    staff_id int not null,
    start_time datetime not null,
    end_time datetime not null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null,
    
    foreign key (staff_id) references staff (staff_id)
);

create table staff_permission (
	permission_id int primary key auto_increment
);

create table users (
	login_id int primary key auto_increment,
    is_owner bool default(1),
    user_id int not null,
    password varchar(100),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null
);

create table customers (
	customer_id int primary key auto_increment,
	branch_id int not null,
	full_name varchar(30) not null,
	gender varchar(30) not null,
	phone varchar(30) unique not null,
	whatsapp_number varchar(30) unique not null,
	email varchar(30) unique not null,
	dob datetime null,
	anniversary_date datetime null,
	photo varchar(30) unique,
	address varchar(30) null,
	notes varchar(30) null,
	customer_flag int not null default(1),
	total_visits int not null default(0),
	average_bill_value int not null default(0),
	total_spend int not null default(0),
	first_visit_date datetime not null,
	last_visit_date datetime not null,
	status bool default(1),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null,
    
    constraint chk_total_visits check (total_visits >= 0),
	constraint chk_avg_bill check (average_bill_value >= 0),
	constraint chk_total_spend check (total_spend >= 0)
);

create table customer_feedback (
	feedback_id int primary key auto_increment,
    customer_id int not null,
	staff_id int not null,
	invoice_id int not null,
	rating int not null,
	comments varchar(100),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
);

create table memberships (
	membership_id int primary key auto_increment,
    membership_no int not null,
    customer_id int not null,
	membership_name varchar(30) not null,
	discount_percentage int not null,
	start_date datetime not null,
	end_date datetime not null,
	status bool default(1),
	created_at datetime default current_timestamp,
    
    constraint chk_discount_per check (discount_percentage >= 0)
);

create table prepaid_cards (
	card_id int primary key auto_increment,
	customer_id int not null,
	card_number int not null,
	balance int not null,
	issued_date datetime default current_timestamp,
	expiry_date datetime not null,
	status bool default(1),
	created_at datetime default current_timestamp,
    
    constraint chk_pre_card_balance check (balance >= 0),
    constraint chk_pre_card_number unique (card_number)
);

create table gift_cards (
	gift_card_id int primary key auto_increment,
	card_number int not null,
	customer_id int not null,
	amount int not null,
	balance int not null,
	issued_date datetime default current_timestamp,
	expiry_date datetime not null,
	status bool default(1),
	created_at datetime default current_timestamp,
    
    constraint chk_gift_card_balance check (balance >= 0),
    constraint chk_gift_card_amt check (amount >= 0),
    constraint chk_gift_card_number unique (card_number)
);

create table vouchers (
	voucher_id int primary key auto_increment,
	voucher_code int not null,
	description varchar(100) not null,
	amount int not null,
	expiry_date datetime not null,
	status bool default(1),
	created_at datetime default current_timestamp,
    
    constraint chk_voucher_amt check (amount >= 0),
    constraint chk_voucher_number unique (voucher_code)
);

create table service_category (
	category_id int primary key auto_increment,
	branch_id int not null,
	category_name varchar(30) not null,
	description varchar(100) not null,
	status bool default(1),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null
);

create table services (
	service_id int primary key auto_increment,
	branch_id int not null,
	category_id int not null,
	service_code varchar(30) not null,
	service_name varchar(30) not null,
	duration_minutes int not null,
	price int not null,
	tax_percentage int not null,
	description varchar(100) not null,
	status bool default(1),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null
);

create table appointment_sources (
	source_id int primary key auto_increment,
	source_name varchar(30) not null
);

create table appointments (
	appointment_id int primary key auto_increment,
	appointment_no int not null,
	branch_id int not null,
	customer_id int not null,
	source_id int not null,
	appointment_date date not null,
	start_time time not null,
	end_time time not null, 
	status bool default(1),
	notes varchar(100),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    deleted_at datetime default null
);

create table appointment_services (
	appointment_service_id int primary key auto_increment,
	appointment_id int not null,
	service_id int not null,
	employee_id int not null,
	start_time time not null,
	end_time time not null,
	price int not null,
	status bool default(1),

	constraint chk_appointment_price check(price >= 0)
);

create table service_slips (
	service_slip_id int primary key auto_increment,
	slip_no int not null,
	appointment_id int not null,
	customer_id int not null,
	subtotal int not null,
	discount int not null,
	tax int not null,
	total_amount int not null,
	generated_at datetime default current_timestamp,
	generated_by int not null,

	constraint chk_discount_service_slip check (discount >= 0),
	constraint chk_tax_service_slip check (tax >= 0),
	constraint chk_total_amt_service_slip check (total_amount >= 0),
	constraint chk_subtotal_service_slip check (subtotal >= 0)
);

create table service_slip_items (
	item_id int primary key auto_increment,
	service_slip_id int not null,
	service_id int not null,
	employee_id int not null,
	service_price int not null,
	start_time time not null,
	end_time time not null,
	actual_start_time time not null,
	actual_end_time time not null,

	constraint chk_service_price_service_slip check (service_price >= 0)
);

create table vendors (
	vendor_id int primary key auto_increment,
	vendor_name varchar(30) not null,
	phone varchar(20) not null,
	primary_contact_name varchar(30) not null,
	primary_contact_phone varchar(20) not null,
	secondary_contact_name varchar(30) not null,
	secondary_contact_phone varchar(20) not null,
	address varchar(30) not null,
	gst_number varchar(30) not null,
	status bool default(1),
	created_at datetime default current_timestamp,
);

create table products (
	product_id int primary key auto_increment,
	vendor_id int primary key not null,
	product_code int primary key not null,
	product_name varchar(30) not null,
	product_type varchar(30) not null,
	unit int not null,
	cost_price int not null,
	selling_price int not null,
	minimum_order_qty int not null,
	current_stock int not null,
	status bool default(1),
	created_at datetime default current_timestamp,

	constraint chk_products_unit check (unit >= 0),
	constraint chk_cost_price_unit check (cost_price >= 0),
	constraint chk_selling_price_unit check (selling_price >= 0),
	constraint chk_minimum_order_qty_unit check (minimum_order_qty >= 0),
	constraint chk_current_stock_unit check (current_stock >= 0)
);

create table service_products (
	service_product_id int primary key auto_increment,
	service_id int not null,
	product_id int not null,
	quantity_required int not null
);

create table purchase_orders (
	po_id int primary key auto_increment,
	po_number int not null,
	vendor_id int not null,
	order_date datetime not null,
	total_amount int not null,
	status bool default(1),
	created_at datetime default current_timestamp,

	constraint chk_total_amount_purchase_orders check (total_amount >= 0)
);

create table purchase_order_items (
	po_item_id int primary key auto_increment,
	po_id int not null,
	product_id int not null,
	qty int not null,
	rate int not null,
	amount int not null,

	constraint chk_qty_purchase_order_items check (qty >= 0),
	constraint chk_rate_purchase_order_items check (rate >= 0),
	constraint chk_amount_purchase_order_items check (amount >= 0)
);

create table vendor_invoices (
	vendor_invoice_id int primary key auto_increment,
	vendor_id int not null,
	invoice_number int not null,
	invoice_date date not null,
	invoice_amount int not null,
	paid_amount int not null,
	balance_amount int not null,
	status bool default(1),
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,

	constraint chk_paid_amount_vendor_invoices check (paid_amount >= 0),
	constraint chk_balance_amount_vendor_invoices check (balance_amount >= 0)
);

create table inventory_transactions (
	inventory_txn_id int primary key auto_increment,
	product_id int not null,
	transaction_type varchar(30) not null,
	qty int not null,
	reference_type varchar(30) not null,
	reference_id int not null,
	remarks varchar(100) not null,
	created_at datetime default current_timestamp,

	constraint chk_qty_inventory_transactions check (qty >= 0)
);

create table invoices (
	invoice_id int primary key auto_increment,
	invoice_number int not null,
	customer_id int not null,
	appointment_id int,
	service_slip_id int not null,
	subtotal int not null,
	discount_amount int not null,
	loyalty_discount int not null,
	tax_amount int not null,
	total_amount int not null,
	invoice_date date not null,
	created_by datetime default current_timestamp,

	constraint chk_subtotal_invoices check (subtotal >= 0),
	constraint chk_discount_amount_invoices check (discount_amount >= 0),
	constraint chk_loyalty_discount_invoices check (loyalty_discount >= 0),
	constraint chk_tax_amount_invoices check (tax_amount >= 0),
	constraint chk_total_amount_invoices check (total_amount >= 0)
);

create table invoice_items (
	invoice_item_id int primary key auto_increment,
	invoice_id int not null,
	item_type varchar(30) not null,
	item_id int not null,
	description varchar(100),
	qty int not null,
	price int not null,
	tax int not null,
	amount int not null,

	constraint chk_qty_invoice_items check (qty >= 0),
	constraint chk_price_invoice_items check (price >= 0),
	constraint chk_tax_invoice_items check (tax >= 0),
	constraint chk_amount_invoice_items check (amount >= 0),
);

create table payments (
	payment_id int primary key auto_increment,
	invoice_id int not null, 
	payment_method varchar(20) not null,
	amount int not null,
	reference_no int not null,
	remarks varchar(100),
	created_at datetime default current_timestamp,

	constraint chk_amount_payments check (amount >= 0)
);

create table expenses (
	expense_id int primary key auto_increment,
	expense_category varchar(20) not null,
	description varchar(100),
	amount int not null,
	payment_method varchar(20) not null,
	authorized_by int not null,
	expense_date datetime not null,
	created_at datetime default current_timestamp,

	constraint chk_expenses_amount check (amount >= 0)
)

create table day_book (
	day_book_id int primary key auto_increment,
	branch_id int not null,
	business_date datetime not null,
	opening_cash int not null,
	cash_sales int not null,
	cash_expenses int not null,
	closing_cash int not null,
	closed_by int not null,
	closed_at datetime not null,

	constraint chk_opening_cash_day_book check (opening_cash >= 0),
	constraint chk_cash_sales_day_book check (cash_sales >= 0),
	constraint chk_cash_expenses_day_book check (cash_expenses >= 0),
	constraint chk_closing_cash_day_book check (closing_cash >= 0)
)

create table campaigns (
	campaign_id int primary key auto_increment,
	campaign_name varchar(30) not null,
	campaign_type varchar(30) not null,
	message_template varchar(30) not null,
	status bool default(1) not null,
	created_at datetime default current_timestamp
);

create table campaign_rules (
	rule_id int primary key auto_increment,
	campaign_id int not null,
	criteria_json json not null,
	repeat_count int not null default(1)
	is_active bool default(1)
);

create table leads (
	lead_id int primary key auto_increment,
	source varchar(30) not null,
	full_name varchar(30) not null,
	phone varchar(30) not null,
	email varchar(30),
	requested_service varchar(30) not null,
	followup_date datetime not null,
	followup_notes varchar(100),
	status bool default(1),
	created_at datetime default current_timestamp
);

create table complaints (
	complaint_id int primary key auto_increment,
	customer_id int not null,
	invoice_id int not null,
	complaint_level int not null,
	description varchar(100),
	corrective_action varchar(100),
	status bool default(1),
	closed_at datetime
);

create table notifications (
	notification_id int primary key auto_increment,
	customer_id int not null,
	channel varchar(20) not null,
	notification_type varchar(2) not null,
	message varchar(100) not null,
	status bool default(1),
	sent_at datetime not null
);

create table audit_logs (
	log_id int primary key auto_increment,
	user_id int not null,
	action varchar(30) not null,
	table_name varchar(30) not null,
	record_id int not null,
	old_values varchar(30) not null,
	new_values varchar(30) not null,
	ip_address varchar(30) not null,
	created_at datetime default current_timestamp
);

create table otp_logs (
	otp_id int primary key auto_increment,
	customer_id int not null,
	card_id int not null, 
	otp_code int not null,
	expires_at datetime not null,
	verified_at datetime not null,
	status bool default(1),
	created_at datetime default current_timestamp
);

create table complaints_feedback_link (
	complaint_feedback_id int primary key auto_increment,
	feedback_id int not null,
	complaint_id int not null,
	created_at datetime default current_timestamp
);

