CREATE SCHEMA IF NOT EXISTS northwind;

CREATE TABLE IF NOT EXISTS northwind.customers (
  id              SERIAL PRIMARY KEY,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     BYTEA,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

comment on table northwind.customers is 'A table that contains customer information, including address and contact data.';
comment on column northwind.customers.id is 'The unique identifier for a customer.';
comment on column northwind.customers.company is 'The name of the company.';
comment on column northwind.customers.last_name is 'The last name of the customer.';
comment on column northwind.customers.first_name is 'The first name of the customer.';
comment on column northwind.customers.email_address is 'The email address of the customer.';
comment on column northwind.customers.job_title is 'The job title of the customer.';
comment on column northwind.customers.business_phone is 'The business phone number of the customer.';
comment on column northwind.customers.home_phone is 'The home phone number of the customer.';
comment on column northwind.customers.mobile_phone is 'The mobile phone number of the customer.';
comment on column northwind.customers.fax_number is 'The fax number of the customer.';
comment on column northwind.customers.address is 'The address of the customer.';
comment on column northwind.customers.city is 'The city of the customer.';
comment on column northwind.customers.state_province is 'The state or province of the customer.';
comment on column northwind.customers.zip_postal_code is 'The zip or postal code of the customer.';
comment on column northwind.customers.country_region is 'The country or region of the customer.';
comment on column northwind.customers.web_page is 'The web page of the customer.';
comment on column northwind.customers.notes is 'Notes about the customer.';
comment on column northwind.customers.attachments is 'Attachments for the customer.';
comment on column northwind.customers.create_timestamp is 'The timestamp when the customer was created.';
comment on column northwind.customers.create_user is 'The user who created the customer.';
comment on column northwind.customers.update_timestamp is 'The timestamp when the customer was last updated.';
comment on column northwind.customers.update_user is 'The user who last updated the customer.';
comment on column northwind.customers.version is 'The version of the customer.';

CREATE TABLE IF NOT EXISTS northwind.employees (
  id              SERIAL PRIMARY KEY,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     BYTEA,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

comment on table northwind.employees is 'A table that contains employee information, including address and contact data.';
comment on column northwind.employees.id is 'The unique identifier for an employee.';
comment on column northwind.employees.company is 'The name of the company.';
comment on column northwind.employees.last_name is 'The last name of the employee.';
comment on column northwind.employees.first_name is 'The first name of the employee.';
comment on column northwind.employees.email_address is 'The email address of the employee.';
comment on column northwind.employees.job_title is 'The job title of the employee.';
comment on column northwind.employees.business_phone is 'The business phone number of the employee.';
comment on column northwind.employees.home_phone is 'The home phone number of the employee.';
comment on column northwind.employees.mobile_phone is 'The mobile phone number of the employee.';
comment on column northwind.employees.fax_number is 'The fax number of the employee.';
comment on column northwind.employees.address is 'The address of the employee.';
comment on column northwind.employees.city is 'The city of the employee.';
comment on column northwind.employees.state_province is 'The state or province of the employee.';
comment on column northwind.employees.zip_postal_code is 'The zip or postal code of the employee.';
comment on column northwind.employees.country_region is 'The country or region of the employee.';
comment on column northwind.employees.web_page is 'The web page of the employee.';
comment on column northwind.employees.notes is 'Notes about the employee.';
comment on column northwind.employees.attachments is 'Attachments for the employee.';
comment on column northwind.employees.create_timestamp is 'The timestamp when the employee was created.';
comment on column northwind.employees.create_user is 'The user who created the employee.';
comment on column northwind.employees.update_timestamp is 'The timestamp when the employee was last updated.';
comment on column northwind.employees.update_user is 'The user who last updated the employee.';
comment on column northwind.employees.version is 'The version of the employee.';

CREATE TABLE IF NOT EXISTS northwind.inventory_transaction_types (
  id        SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

comment on table northwind.inventory_transaction_types is 'A table that contains inventory transaction types.';
comment on column northwind.inventory_transaction_types.id is 'The unique identifier for an inventory transaction type.';
comment on column northwind.inventory_transaction_types.type_name is 'The name of the inventory transaction type.';
comment on column northwind.inventory_transaction_types.create_timestamp is 'The timestamp when the inventory transaction type was created.';
comment on column northwind.inventory_transaction_types.create_user is 'The user who created the inventory transaction type.';
comment on column northwind.inventory_transaction_types.update_timestamp is 'The timestamp when the inventory transaction type was last updated.';
comment on column northwind.inventory_transaction_types.update_user is 'The user who last updated the inventory transaction type.';
comment on column northwind.inventory_transaction_types.version is 'The version of the inventory transaction type.';

CREATE TABLE IF NOT EXISTS northwind.shippers (
  id              SERIAL PRIMARY KEY,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     BYTEA,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

comment on table northwind.shippers is 'A table that contains shipper information, including address and contact data.';
comment on column northwind.shippers.id is 'The unique identifier for a shipper.';
comment on column northwind.shippers.company is 'The name of the company.';
comment on column northwind.shippers.last_name is 'The last name of the shipper.';
comment on column northwind.shippers.first_name is 'The first name of the shipper.';
comment on column northwind.shippers.email_address is 'The email address of the shipper.';
comment on column northwind.shippers.job_title is 'The job title of the shipper.';
comment on column northwind.shippers.business_phone is 'The business phone number of the shipper.';
comment on column northwind.shippers.home_phone is 'The home phone number of the shipper.';
comment on column northwind.shippers.mobile_phone is 'The mobile phone number of the shipper.';
comment on column northwind.shippers.fax_number is 'The fax number of the shipper.';
comment on column northwind.shippers.address is 'The address of the shipper.';
comment on column northwind.shippers.city is 'The city of the shipper.';
comment on column northwind.shippers.state_province is 'The state or province of the shipper.';
comment on column northwind.shippers.zip_postal_code is 'The zip or postal code of the shipper.';
comment on column northwind.shippers.country_region is 'The country or region of the shipper.';
comment on column northwind.shippers.web_page is 'The web page of the shipper.';
comment on column northwind.shippers.notes is 'Notes about the shipper.';
comment on column northwind.shippers.attachments is 'Attachments for the shipper.';
comment on column northwind.shippers.create_timestamp is 'The timestamp when the shipper was created.';
comment on column northwind.shippers.create_user is 'The user who created the shipper.';
comment on column northwind.shippers.update_timestamp is 'The timestamp when the shipper was last updated.';
comment on column northwind.shippers.update_user is 'The user who last updated the shipper.';
comment on column northwind.shippers.version is 'The version of the shipper.';

CREATE TABLE IF NOT EXISTS northwind.orders_status (
  id          SERIAL PRIMARY KEY,
  status_name VARCHAR(50) NOT NULL,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

comment on table northwind.orders_status is 'A table that contains order status information.';
comment on column northwind.orders_status.id is 'The unique identifier for an order status.';
comment on column northwind.orders_status.status_name is 'The name of the order status.';
comment on column northwind.orders_status.create_timestamp is 'The timestamp when the order status was created.';
comment on column northwind.orders_status.create_user is 'The user who created the order status.';
comment on column northwind.orders_status.update_timestamp is 'The timestamp when the order status was last updated.';
comment on column northwind.orders_status.update_user is 'The user who last updated the order status.';
comment on column northwind.orders_status.version is 'The version of the order status.';


CREATE TABLE IF NOT EXISTS northwind.orders_tax_status (
  id              SERIAL PRIMARY KEY,
  tax_status_name VARCHAR(50) NOT NULL,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);



CREATE TABLE IF NOT EXISTS northwind.orders (
  id                    SERIAL PRIMARY KEY,
  employee_id           INTEGER ,
  customer_id           INTEGER ,
  order_date            TIMESTAMP WITH TIME ZONE ,
  shipped_date          TIMESTAMP WITH TIME ZONE ,
  shipper_id            INTEGER ,
  ship_name             VARCHAR(50) ,
  ship_address          VARCHAR(250) ,
  ship_city             VARCHAR(50) ,
  ship_state_province   VARCHAR(50) ,
  ship_zip_postal_code  VARCHAR(50) ,
  ship_country_region   VARCHAR(50) ,
  shipping_fee          DECIMAL(19,4) NULL DEFAULT '0.0000',
  taxes                 DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_type          VARCHAR(50) ,
  paid_date             TIMESTAMP WITH TIME ZONE ,
  notes                 VARCHAR(250) ,
  tax_rate              DOUBLE PRECISION NULL DEFAULT '0',
  tax_status_id         SMALLINT ,
  status_id             SMALLINT NULL DEFAULT '0',
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0,
  CONSTRAINT fk_orders__customers FOREIGN KEY (customer_id) REFERENCES northwind.customers(id),
	CONSTRAINT fk_orders__employees FOREIGN KEY (employee_id) REFERENCES northwind.employees(id),
	CONSTRAINT fk_orders__orders_status FOREIGN KEY (status_id) REFERENCES northwind.orders_status(id),
	CONSTRAINT fk_orders__orders_tax_status FOREIGN KEY (tax_status_id) REFERENCES northwind.orders_tax_status(id),
	CONSTRAINT fk_orders__shippers FOREIGN KEY (shipper_id) REFERENCES northwind.shippers(id)
);

CREATE TABLE IF NOT EXISTS northwind.order_details_status (
  id            SERIAL PRIMARY KEY,
  status_name   VARCHAR(50) NOT NULL,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

CREATE TABLE IF NOT EXISTS northwind.products (
  id              SERIAL PRIMARY KEY,
  supplier_ids    VARCHAR(250) ,
  product_code    VARCHAR(25) ,
  product_name    VARCHAR(50) ,
  description     VARCHAR(250) ,
  standard_cost   DECIMAL(19,4) NULL DEFAULT '0.0000',
  list_price      DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  reorder_level   INTEGER ,
  target_level    INTEGER ,
  quantity_per_unit VARCHAR(50) ,
  discontinued    SMALLINT NOT NULL DEFAULT 0,
  minimum_reorder_quantity INTEGER ,
  category        VARCHAR(50) ,
  attachments     BYTEA,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

CREATE TABLE IF NOT EXISTS northwind.order_details (
  id                  SERIAL PRIMARY KEY,
  order_id            INTEGER NOT NULL,
  product_id          INTEGER ,
  quantity            DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  unit_price          DECIMAL(19,4) NULL DEFAULT '0.0000',
  discount            DOUBLE PRECISION NULL DEFAULT 0,
  status_id           INTEGER ,
  date_allocated      TIMESTAMP WITH TIME ZONE ,
  purchase_order_id   INTEGER ,
  inventory_id        INTEGER,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0,
  CONSTRAINT fk_order_details__order_details_status FOREIGN KEY (status_id) REFERENCES northwind.order_details_status(id),
	CONSTRAINT fk_order_details__orders FOREIGN KEY (order_id) REFERENCES northwind.orders(id),
	CONSTRAINT fk_order_details__products FOREIGN KEY (product_id) REFERENCES northwind.products(id)
);

CREATE TABLE IF NOT EXISTS northwind.suppliers (
  id              SERIAL PRIMARY KEY,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     BYTEA,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

CREATE TABLE IF NOT EXISTS northwind.purchase_order_status (
  id      SERIAL PRIMARY KEY,
  status  VARCHAR(50),
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

CREATE TABLE IF NOT EXISTS northwind.purchase_orders (
  id              SERIAL PRIMARY KEY,
  supplier_id     INTEGER ,
  created_by      INTEGER ,
  submitted_date  TIMESTAMP WITH TIME ZONE ,
  creation_date   TIMESTAMP WITH TIME ZONE ,
  status_id       INTEGER NULL DEFAULT '0',
  expected_date   TIMESTAMP WITH TIME ZONE ,
  shipping_fee    DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  payment_date    TIMESTAMP WITH TIME ZONE ,
  payment_amount  DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_method  VARCHAR(50) ,
  notes           VARCHAR(250) ,
  approved_by     INTEGER ,
  approved_date   TIMESTAMP WITH TIME ZONE ,
  submitted_by    INTEGER,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0,
  CONSTRAINT fk_purchase_orders__employees FOREIGN KEY (created_by) REFERENCES northwind.employees(id),
	CONSTRAINT fk_purchase_orders__purchase_order_status FOREIGN KEY (status_id) REFERENCES northwind.purchase_order_status(id),
	CONSTRAINT fk_purchase_orders__suppliers FOREIGN KEY (supplier_id) REFERENCES northwind.suppliers(id)
);

CREATE TABLE IF NOT EXISTS northwind.inventory_transactions (
  id                  SERIAL PRIMARY KEY,
  transaction_type    INTEGER NOT NULL,
  transaction_created_date    TIMESTAMP WITH TIME ZONE ,
  transaction_modified_date   TIMESTAMP WITH TIME ZONE ,
  product_id          INTEGER NOT NULL,
  quantity            INTEGER NOT NULL,
  purchase_order_id   INTEGER ,
  customer_order_id   INTEGER ,
  comments            VARCHAR(255),
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0,
  CONSTRAINT fk_inventory_transactions__inventory_transaction_types FOREIGN KEY (transaction_type) REFERENCES northwind.inventory_transaction_types(id),
	CONSTRAINT fk_inventory_transactions__orders FOREIGN KEY (customer_order_id) REFERENCES northwind.orders(id),
	CONSTRAINT fk_inventory_transactions__products FOREIGN KEY (product_id) REFERENCES northwind.products(id),
	CONSTRAINT fk_inventory_transactions__purchase_orders FOREIGN KEY (purchase_order_id) REFERENCES northwind.purchase_orders(id)
);

CREATE TABLE IF NOT EXISTS northwind.purchase_order_details (
  id                  SERIAL PRIMARY KEY,
  purchase_order_id   INTEGER NOT NULL,
  product_id          INTEGER ,
  quantity            DECIMAL(18,4) NOT NULL,
  unit_cost           DECIMAL(19,4) NOT NULL,
  date_received       TIMESTAMP WITH TIME ZONE ,
  posted_to_inventory SMALLINT NOT NULL DEFAULT 0,
  inventory_id        INTEGER,
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0,
  CONSTRAINT fk_purchase_order_details__inventory_transactions FOREIGN KEY (inventory_id) REFERENCES northwind.inventory_transactions(id),
	CONSTRAINT fk_purchase_order_details__products FOREIGN KEY (product_id) REFERENCES northwind.products(id),
	CONSTRAINT fk_purchase_order_details__purchase_orders FOREIGN KEY (purchase_order_id) REFERENCES northwind.purchase_orders(id)
);

CREATE TABLE IF NOT EXISTS northwind.invoices (
  id            SERIAL PRIMARY KEY,
  order_id      INTEGER ,
  invoice_date  TIMESTAMP WITH TIME ZONE ,
  due_date      TIMESTAMP WITH TIME ZONE ,
  tax           DECIMAL(19,4) NULL DEFAULT '0.0000',
  shipping      DECIMAL(19,4) NULL DEFAULT '0.0000',
  amount_due    DECIMAL(19,4) NULL DEFAULT '0.0000',
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0,
  CONSTRAINT fk_invoices__orders FOREIGN KEY (order_id) REFERENCES northwind.orders(id)
);

CREATE TABLE IF NOT EXISTS northwind.strings (
  string_id   SERIAL PRIMARY KEY,
  string_data VARCHAR(255),
  create_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp not null,
  create_user             VARCHAR(50) not null,
  update_timestamp        TIMESTAMP WITH TIME ZONE default current_timestamp,
  update_user             VARCHAR(50),
  version                 INTEGER default 0
);

INSERT INTO northwind.inventory_transaction_types (id, type_name, create_user) VALUES
    (1, 'Purchased', 'system'),
    (2, 'Sold', 'system'),
    (3, 'On Hold', 'system'),
    (4, 'Waste', 'system')
ON CONFLICT (id) DO UPDATE
SET type_name = EXCLUDED.type_name;

INSERT INTO northwind.order_details_status (id, status_name, create_user) VALUES
     (0, 'None', 'system')
    ,(1, 'Allocated', 'system')
    ,(2, 'Invoiced', 'system')
    ,(3, 'Shipped', 'system')
    ,(4, 'On Order', 'system')
    ,(5, 'No Stock', 'system')
ON CONFLICT (id) DO UPDATE
SET status_name = EXCLUDED.status_name;

INSERT INTO northwind.orders_status (id, status_name, create_user) VALUES
     (0, 'New', 'system')
    ,(1, 'Invoiced', 'system')
    ,(2, 'Shipped', 'system')
    ,(3, 'Closed', 'system')
ON CONFLICT (id) DO UPDATE
SET status_name = EXCLUDED.status_name;

INSERT INTO northwind.orders_tax_status (id, tax_status_name, create_user) VALUES
     (0, 'Tax Exempt', 'system')
    ,(1, 'Taxable', 'system')
ON CONFLICT (id) DO UPDATE
SET tax_status_name = EXCLUDED.tax_status_name;

INSERT INTO northwind.purchase_order_status (id, status, create_user) VALUES
     (0, 'New', 'system')
    ,(1, 'Submitted', 'system')
    ,(2, 'Approved', 'system')
    ,(3, 'Closed', 'system')
ON CONFLICT (id) DO UPDATE
SET status = EXCLUDED.status;

INSERT INTO northwind.strings (string_id, string_data, create_user) VALUES
     (2 , 'Northwind Traders', 'system')
    ,(3 , 'Cannot remove posted inventory!', 'system')
    ,(4 , 'Back ordered product filled for Order #|', 'system')
    ,(5 , 'Discounted price below cost!', 'system')
    ,(6 , 'Insufficient inventory.', 'system')
    ,(7 , 'Insufficient inventory. Do you want to create a purchase order?', 'system')
    ,(8 , 'Purchase orders were successfully created for | products', 'system')
    ,(9 , 'There are no products below their respective reorder levels', 'system')
    ,(10, 'Must specify customer name!', 'system')
    ,(11, 'Restocking will generate purchase orders for all products below desired inventory levels.  Do you want to continue?', 'system')
    ,(12, 'Cannot create purchase order.  No suppliers listed for specified product', 'system')
    ,(13, 'Discounted price is below cost!', 'system')
    ,(14, 'Do you want to continue?', 'system')
    ,(15, 'Order is already invoiced. Do you want to print the invoice?', 'system')
    ,(16, 'Order does not contain any line items', 'system')
    ,(17, 'Cannot create invoice!  Inventory has not been allocated for each specified product.', 'system')
    ,(18, 'Sorry, there are no sales in the specified time period', 'system')
    ,(19, 'Product successfully restocked.', 'system')
    ,(21, 'Product does not need restocking! Product is already at desired inventory level.', 'system')
    ,(22, 'Product restocking failed!', 'system')
    ,(23, 'Invalid login specified!', 'system')
    ,(24, 'Must first select reported!', 'system')
    ,(25, 'Changing supplier will remove purchase line items, continue?', 'system')
    ,(26, 'Purchase orders were successfully submitted for | products.  Do you want to view the restocking report?', 'system')
    ,(27, 'There was an error attempting to restock inventory levels.', 'system')
    ,(28, '| product(s) were successfully restocked.  Do you want to view the restocking report?', 'system')
    ,(29, 'You cannot remove purchase line items already posted to inventory!', 'system')
    ,(30, 'There was an error removing one or more purchase line items.', 'system')
    ,(31, 'You cannot modify quantity for purchased product already received or posted to inventory.', 'system')
    ,(32, 'You cannot modify price for purchased product already received or posted to inventory.', 'system')
    ,(33, 'Product has been successfully posted to inventory.', 'system')
    ,(34, 'Sorry, product cannot be successfully posted to inventory.', 'system')
    ,(35, 'There are orders with this product on back order.  Would you like to fill them now?', 'system')
    ,(36, 'Cannot post product to inventory without specifying received date!', 'system')
    ,(37, 'Do you want to post received product to inventory?', 'system')
    ,(38, 'Initialize purchase, orders, and inventory data?', 'system')
    ,(39, 'Must first specify employee name!', 'system')
    ,(40, 'Specified user must be logged in to approve purchase!', 'system')
    ,(41, 'Purchase order must contain completed line items before it can be approved', 'system')
    ,(42, 'Sorry, you do not have permission to approve purchases.', 'system')
    ,(43, 'Purchase successfully approved', 'system')
    ,(44, 'Purchase cannot be approved', 'system')
    ,(45, 'Purchase successfully submitted for approval', 'system')
    ,(46, 'Purchase cannot be submitted for approval', 'system')
    ,(47, 'Sorry, purchase order does not contain line items', 'system')
    ,(48, 'Do you want to cancel this order?', 'system')
    ,(49, 'Canceling an order will permanently delete the order.  Are you sure you want to cancel?', 'system')
    ,(100, 'Your order was successfully canceled.', 'system')
    ,(101, 'Cannot cancel an order that has items received and posted to inventory.', 'system')
    ,(102, 'There was an error trying to cancel this order.', 'system')
    ,(103, 'The invoice for this order has not yet been created.', 'system')
    ,(104, 'Shipping information is not complete.  Please specify all shipping information and try again.', 'system')
    ,(105, 'Cannot mark as shipped.  Order must first be invoiced!', 'system')
    ,(106, 'Cannot cancel an order that has already shipped!', 'system')
    ,(107, 'Must first specify salesperson!', 'system')
    ,(108, 'Order is now marked closed.', 'system')
    ,(109, 'Order must first be marked shipped before closing.', 'system')
    ,(110, 'Must first specify payment information!', 'system')
    ,(111, 'There was an error attempting to restock inventory levels.  | product(s) were successfully restocked.', 'system')
    ,(112, 'You must supply a Unit Cost.', 'system')
    ,(113, 'Fill back ordered product, Order #|', 'system')
    ,(114, 'Purchase generated based on Order #|', 'system')
ON CONFLICT (string_id) DO UPDATE
SET string_data = EXCLUDED.string_data;


--- This is to reset all sequences to the expected value

DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        select
			table_schema,
            table_name,
            column_name,
            sequence_name
        FROM
            information_schema.columns
        JOIN
            information_schema.sequences
        ON
            sequence_schema = table_schema
            AND sequence_name = table_name || '_' || column_name || '_seq'
        WHERE
            column_default LIKE 'nextval%'
           and table_schema = 'northwind'
    LOOP
        EXECUTE 'SELECT setval(''' || rec.table_schema || '.' || rec.sequence_name || ''', COALESCE((SELECT MAX(' || rec.column_name || ') FROM ' || rec.table_schema || '.' || rec.table_name || '), 1))';
    END LOOP;
END $$;
