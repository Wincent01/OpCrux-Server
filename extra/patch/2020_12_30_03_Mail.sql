/*
   Mittwoch, 30. Dezember 202010:51:51
   Benutzer: 
   Server: localhost
   Datenbank: OPCRUX_GD
   Anwendung: 
*/

/* Überprüfen Sie das Skript gründlich, bevor Sie es außerhalb des Datenbank-Designer-Kontexts ausführen, um potenzielle Datenverluste zu vermeiden.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Mail
	(
	mailID bigint NOT NULL IDENTITY (1, 1),
	receiver bigint NOT NULL,
	subject varchar(50) NOT NULL,
	body varchar(400) NOT NULL,
	sender varchar(32) NOT NULL,
	attachedCurrency bigint NOT NULL,
	attachedObjectID bigint NOT NULL,
	attachedLOT int NOT NULL,
	attachedSubkey bigint NOT NULL,
	expirationDate bigint NOT NULL,
	sendDate bigint NOT NULL,
	markedAsSeen bit NOT NULL,
	hasBeenModerated bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Mail SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Mail ON
GO
IF EXISTS(SELECT * FROM dbo.Mail)
	 EXEC('INSERT INTO dbo.Tmp_Mail (mailID, receiver, subject, body, sender, attachedCurrency, attachedObjectID, attachedLOT, attachedSubkey, expirationDate, sendDate, markedAsSeen)
		SELECT mailID, receiver, subject, body, sender, attachedCurrency, attachedObjectID, attachedLOT, attachedSubkey, expirationDate, sendDate, markedAsSeen FROM dbo.Mail WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Mail OFF
GO
DROP TABLE dbo.Mail
GO
EXECUTE sp_rename N'dbo.Tmp_Mail', N'Mail', 'OBJECT' 
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Mail', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Mail', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Mail', 'Object', 'CONTROL') as Contr_Per 