/*
   Mittwoch, 30. Dezember 202006:19:32
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
ALTER TABLE dbo.Characters ADD
	maxhealth int NULL,
	maximagination int NULL,
	maxarmor int NULL,
	maxinventory int NULL
GO
ALTER TABLE dbo.Characters SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Characters', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Characters', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Characters', 'Object', 'CONTROL') as Contr_Per ;

UPDATE dbo.Characters SET maxhealth = 4, maxarmor = 0, maximagination = 0, maxinventory = 20;

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
CREATE TABLE dbo.Tmp_Characters_1
	(
	objectID bigint NOT NULL IDENTITY (1, 1),
	accountID int NOT NULL,
	charIndex tinyint NOT NULL,
	name varchar(50) NOT NULL,
	pendingName varchar(50) NULL,
	styleID int NOT NULL,
	statsID int NOT NULL,
	lastWorld smallint NOT NULL,
	lastInstance smallint NOT NULL,
	lastClone int NOT NULL,
	lastLog bigint NOT NULL,
	positionX float(53) NOT NULL,
	positionY float(53) NOT NULL,
	positionZ float(53) NOT NULL,
	shirtObjectID bigint NOT NULL,
	pantsObjectID bigint NOT NULL,
	uScore int NOT NULL,
	uLevel int NOT NULL,
	currency int NOT NULL,
	reputation int NOT NULL,
	health int NOT NULL,
	imagination int NOT NULL,
	armor int NOT NULL,
	maxhealth int NOT NULL,
	maximagination int NOT NULL,
	maxarmor int NOT NULL,
	maxinventory int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Characters_1 SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Characters_1 ON
GO
IF EXISTS(SELECT * FROM dbo.Characters)
	 EXEC('INSERT INTO dbo.Tmp_Characters_1 (objectID, accountID, charIndex, name, pendingName, styleID, statsID, lastWorld, lastInstance, lastClone, lastLog, positionX, positionY, positionZ, shirtObjectID, pantsObjectID, uScore, uLevel, currency, reputation, health, imagination, armor, maxhealth, maximagination, maxarmor, maxinventory)
		SELECT objectID, accountID, charIndex, name, pendingName, styleID, statsID, lastWorld, lastInstance, lastClone, lastLog, positionX, positionY, positionZ, shirtObjectID, pantsObjectID, uScore, uLevel, currency, reputation, health, imagination, armor, maxhealth, maximagination, maxarmor, maxinventory FROM dbo.Characters WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Characters_1 OFF
GO
DROP TABLE dbo.Characters
GO
EXECUTE sp_rename N'dbo.Tmp_Characters_1', N'Characters', 'OBJECT' 
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Characters ON dbo.Characters
	(
	styleID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Characters', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Characters', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Characters', 'Object', 'CONTROL') as Contr_Per 