CREATE TABLE [dbo].[notes] (
    [note_id]     INT           IDENTITY (1, 1) NOT NULL,
    [customer_id] INT           NULL,
    [note_text]   VARCHAR (255) NULL,
    CONSTRAINT [PK_NoteId] PRIMARY KEY CLUSTERED ([note_id] ASC),
    CONSTRAINT [FK_notes_customer_id] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([customer_id]) ON DELETE CASCADE ON UPDATE CASCADE
);

