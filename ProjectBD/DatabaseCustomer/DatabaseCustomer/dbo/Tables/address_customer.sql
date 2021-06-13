CREATE TABLE [dbo].[address_customer] (
    [address_id]    INT           IDENTITY (1, 1) NOT NULL,
    [customer_id]   INT           NOT NULL,
    [address_line]  VARCHAR (100) NOT NULL,
    [address_line2] VARCHAR (100) NULL,
    [address_type]  VARCHAR (15)  NOT NULL,
    [city]          VARCHAR (50)  NOT NULL,
    [postal_code]   CHAR (6)      NOT NULL,
    [state]         CHAR (20)     NOT NULL,
    [country]       VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_address_id] PRIMARY KEY CLUSTERED ([address_id] ASC),
    CHECK ([address_type]='Billing' OR [address_type]='Shipping'),
    CHECK ([country]='Canada' OR [country]='United States'),
    CONSTRAINT [FK_address_customer_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([customer_id]) ON DELETE CASCADE ON UPDATE CASCADE
);

