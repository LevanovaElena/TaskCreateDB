CREATE DATABASE CustomerDB_Levanova
go

use CustomerDB_Levanova

go

CREATE TABLE Customer (
    CustomerId int IDENTITY(1,1) CONSTRAINT PK_CustomerId PRIMARY KEY,
	FirstName varchar(50),
    LastName varchar(50) NOT NULL UNIQUE,
    CustomerPhoneNumber varchar(15) NOT NULL,
	CustomerEmail varchar(255),
    TotalPurchasesAmount  Money,
)

go

CREATE TABLE Notes(
	NoteId int IDENTITY(1,1) CONSTRAINT PK_NoteId PRIMARY KEY,
	CustomerId int,
	Note varchar(255)
)

go

CREATE TABLE AddressCustomer  (
    AddressId int IDENTITY(1,1) CONSTRAINT PK_AddressId PRIMARY KEY,
	CustomerId int NOT NULL,
	AddressLine varchar(100)NOT NULL,
    AddressLine2 varchar(100) ,
    AddressType varchar(15) NOT NULL CHECK (AddressType IN ('Shipping', 'Billing')),
	City varchar(50) NOT NULL,
	PostalCode char(6) NOT NULL,
    [State]  char(20) NOT NULL,
	Country  varchar(255) NOT NULL CHECK ( Country IN ('United States', 'Canada'))
)


go

ALTER TABLE Notes
   ADD CONSTRAINT FK_Notes_CustomerId FOREIGN KEY (CustomerId)
       REFERENCES Customer (CustomerId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
go

ALTER TABLE AddressCustomer
   ADD CONSTRAINT FK_AddressCustomer_CustomerId FOREIGN KEY (CustomerId)
       REFERENCES Customer (CustomerId)
      ON DELETE CASCADE
      ON UPDATE CASCADE
