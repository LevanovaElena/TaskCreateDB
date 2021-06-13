USE customer_db_Levanova

GO

CREATE PROCEDURE CustomerCrud AS
BEGIN
	Delete FROM customers;
	Delete FROM address_customer;
	Delete FROM notes;


	INSERT INTO dbo.customers (first_name,last_name,phone_number,customer_email,total_purchases_amount)
	VALUES ('Kirill','Sidorov','+37494360360','sidorov@gmail.com',785);

	INSERT INTO dbo.address_customer(address_line,address_line2,address_type,postal_code,[state],country,city,customer_id)
	VALUES ('Popova 45','Lenina 3','Billing','123456','State','United States','New York',
			(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Sidorov'))

	INSERT INTO dbo.Notes(note_text,customer_id)
	VALUES ('It is new note',(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Sidorov'))

	INSERT INTO dbo.customers (first_name,last_name,phone_number,customer_email,total_purchases_amount)
	VALUES ('Ivan','Kozlov','+37494360360','ivan@gmail.com',785);

	INSERT INTO dbo.address_customer(address_line,address_line2,address_type,postal_code,[state],country,city,customer_id)
	VALUES ('Filipova 45','Lenina 45','Billing','123456','State','Canada','Ottawa',
			(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Kozlov'))

	INSERT INTO dbo.Notes(note_text,customer_id)
	VALUES ('Filipova 23OttawaNotes2',(SELECT TOP 1 dbo.customers.customer_id from dbo.customers where dbo.customers.last_name='Kozlov'))


	

    SELECT first_name,last_name,customer_email,phone_number,total_purchases_amount,note_text,address_line,address_line2,address_type,[state],country
    FROM customers 
	JOIN notes	ON notes.customer_id=customers.customer_id
	JOIN address_customer ON address_customer.customer_id=customers.customer_id
	ORDER BY last_name


	UPDATE customers SET dbo.customers.last_name='Korolev' FROM customers WHERE last_name='Sidorov'


	DELETE FROM customers WHERE dbo.customers.last_name='Kozlov'

	SELECT first_name,last_name,customer_email,phone_number,total_purchases_amount,note_text,address_line,address_line2,address_type,[state],country
    FROM customers 
	JOIN notes	ON notes.customer_id=customers.customer_id
	JOIN address_customer ON address_customer.customer_id=customers.customer_id
	ORDER BY last_name
END;

GO

EXEC CustomerCrud