use customer_db_Levanova1

GO

--correct dates

INSERT INTO dbo.customers (first_name,last_name,phone_number,customer_email,total_purchases_amount)
VALUES ('Ivan','Ivanov','+37494360360','ivan@gmail.com',785);

INSERT INTO dbo.address_customer(address_line,address_line2,address_type,postal_code,[state],country,city,customer_id)
VALUES ('Filipova 23','Lenina 23','Billing','123456','State','Canada','Ottawa',(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Ivanov'))

INSERT INTO dbo.Notes(note_text,customer_id)
VALUES ('Filipova 23Ottawa',(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Ivanov'))


GO 

--not correct date

INSERT INTO dbo.customers (first_name,last_name,phone_number,customer_email,total_purchases_amount)
VALUES ('Ivan','IvIvaIvIvanovIvanovIvanovIvanovIvanovIvIvanovIvanovIvanovIvanovIvanovnovIvanovIvanovIvanovIvanov','+37494360360','ivan@gmail.com',785);

INSERT INTO  dbo.address_customer(address_line,address_line2,address_type,postal_code,[state],country,city,customer_id)
VALUES ('Filipova 23','Lenina 23','Billing1','123456','State','Canada1','Ottawa',
		(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Ivanov'))

INSERT INTO  dbo.address_customer(address_line,address_line2,address_type,postal_code,[state],country,city,customer_id)
VALUES ('Filipova 23','Lenina 23','Billing','123456','State','Canada1','Ottawa',
	(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Ivanov'))

INSERT INTO dbo.address_customer(address_line,address_line2,address_type,postal_code,[state],country,city,customer_id)
VALUES ('Filipova 23','Lenina 23','Billing',null,'State','Canada','Ottawa',
	(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Ivanov'))

GO

SELECT * FROM customers;
SELECT * FROM address_customer;
SELECT * FROM notes;

GO

--DELETE FROM customers WHERE dbo.customers.last_name='Ivanov'