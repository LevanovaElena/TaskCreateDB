CREATE TABLE [dbo].[customers] (
    [customer_id]            INT           IDENTITY (1, 1) NOT NULL,
    [first_name]             VARCHAR (50)  NULL,
    [last_name]              VARCHAR (50)  NOT NULL,
    [phone_number]           VARCHAR (15)  NOT NULL,
    [customer_email]         VARCHAR (255) NULL,
    [total_purchases_amount] MONEY         NULL,
    CONSTRAINT [PK_CustomerId] PRIMARY KEY CLUSTERED ([customer_id] ASC),
    UNIQUE NONCLUSTERED ([last_name] ASC)
);

