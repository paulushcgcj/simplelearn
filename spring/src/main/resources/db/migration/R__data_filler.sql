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
