CREATE DATABASE customer_db_Levanova
go

use customer_db_Levanova

go

CREATE TABLE customers (
    customer_id int IDENTITY(1,1) CONSTRAINT PK_CustomerId PRIMARY KEY,
	first_name varchar(50),
    last_name varchar(50) NOT NULL UNIQUE,
    phone_number varchar(15) NOT NULL,
	customer_email varchar(255),
    total_purchases_amount  Money,
)

go

CREATE TABLE notes(
	note_id int IDENTITY(1,1) CONSTRAINT PK_NoteId PRIMARY KEY,
	customer_id int,
	note_text varchar(255)
)

go

CREATE TABLE address_customer  (
    address_id int IDENTITY(1,1) CONSTRAINT PK_address_id PRIMARY KEY,
	customer_id int NOT NULL,
	address_line varchar(100)NOT NULL,
    address_line2 varchar(100) ,
    address_type varchar(15) NOT NULL CHECK (address_type IN ('Shipping', 'Billing')),
	city varchar(50) NOT NULL,
	postal_code char(6) NOT NULL,
    [state]  char(20) NOT NULL,
	country  varchar(255) NOT NULL CHECK ( country IN ('United States', 'Canada'))
)


go

ALTER TABLE notes
   ADD CONSTRAINT FK_notes_customer_id FOREIGN KEY (customer_id)
       REFERENCES customers (customer_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
go

ALTER TABLE address_customer
   ADD CONSTRAINT FK_address_customer_customer_id FOREIGN KEY (customer_id)
       REFERENCES customers (customer_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE

