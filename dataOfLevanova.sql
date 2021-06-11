use CustomerDB_Levanova

GO

--correct dates

INSERT INTO dbo.Customer (FirstName,LastName,CustomerPhoneNumber,CustomerEmail,TotalPurchasesAmount)
VALUES ('Ivan','Ivanov','+37494360360','ivan@gmail.com',785);

INSERT INTO dbo.AddressCustomer(AddressLine,AddressLine2,AddressType,PostalCode,[State],Country,City,CustomerId)
VALUES ('Filipova 23','Lenina 23','Billing','123456','State','Canada','Ottawa',(SELECT TOP 1 dbo.Customer.CustomerId from dbo.Customer where dbo.Customer.LastName='Ivanov'))

INSERT INTO dbo.Notes(Note,CustomerId)
VALUES ('Filipova 23Ottawa',(SELECT TOP 1 dbo.Customer.CustomerId from dbo.Customer where dbo.Customer.LastName='Ivanov'))


GO 

--not correct date

INSERT INTO dbo.Customer (FirstName,LastName,CustomerPhoneNumber,CustomerEmail,TotalPurchasesAmount)
VALUES ('Ivan','IvIvaIvIvanovIvanovIvanovIvanovIvanovIvIvanovIvanovIvanovIvanovIvanovnovIvanovIvanovIvanovIvanov','+37494360360','ivan@gmail.com',785);

INSERT INTO dbo.AddressCustomer(AddressLine,AddressLine2,AddressType,PostalCode,[State],Country,City,CustomerId)
VALUES ('Filipova 23','Lenina 23','Billing1','123456','State','Canada1','Ottawa',(SELECT TOP 1 dbo.Customer.CustomerId from dbo.Customer where dbo.Customer.LastName='Ivanov'))

INSERT INTO dbo.AddressCustomer(AddressLine,AddressLine2,AddressType,PostalCode,[State],Country,City,CustomerId)
VALUES ('Filipova 23','Lenina 23','Billing','123456','State','Canada1','Ottawa',(SELECT TOP 1 dbo.Customer.CustomerId from dbo.Customer where dbo.Customer.LastName='Ivanov'))

INSERT INTO dbo.AddressCustomer(AddressLine,AddressLine2,AddressType,PostalCode,[State],Country,City,CustomerId)
VALUES ('Filipova 23','Lenina 23','Billing',null,'State','Canada','Ottawa',(SELECT TOP 1 dbo.Customer.CustomerId from dbo.Customer where dbo.Customer.LastName='Ivanov'))

GO

SELECT * FROM Customer;
SELECT * FROM AddressCustomer;
SELECT * FROM Notes;

GO

--DELETE FROM Customer WHERE dbo.Customer.LastName='Ivanov'