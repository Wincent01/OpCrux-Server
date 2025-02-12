USE [master]
GO
/****** Object:  Database [OPCRUX_GD]    Script Date: 20.12.2019 16:15:06 ******/
CREATE DATABASE [OPCRUX_GD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OPCRUX_GD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OPCRUX_GD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OPCRUX_GD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OPCRUX_GD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OPCRUX_GD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OPCRUX_GD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OPCRUX_GD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET ARITHABORT OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OPCRUX_GD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OPCRUX_GD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OPCRUX_GD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OPCRUX_GD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET RECOVERY FULL 
GO
ALTER DATABASE [OPCRUX_GD] SET  MULTI_USER 
GO
ALTER DATABASE [OPCRUX_GD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OPCRUX_GD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OPCRUX_GD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OPCRUX_GD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OPCRUX_GD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OPCRUX_GD', N'ON'
GO
ALTER DATABASE [OPCRUX_GD] SET QUERY_STORE = OFF
GO
USE [OPCRUX_GD]
GO
/****** Object:  User [dev_opcrux]    Script Date: 20.12.2019 16:15:06 ******/
CREATE USER [dev_opcrux] FOR LOGIN [dev_opcrux] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 20.12.2019 16:15:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[objectID] [bigint] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[charIndex] [tinyint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[pendingName] [varchar](50) NULL,
	[styleID] [int] NOT NULL,
	[statsID] [int] NOT NULL,
	[lastWorld] [smallint] NOT NULL,
	[lastInstance] [smallint] NOT NULL,
	[lastClone] [int] NOT NULL,
	[lastLog] [bigint] NOT NULL,
	[positionX] [float] NOT NULL,
	[positionY] [float] NOT NULL,
	[positionZ] [float] NOT NULL,
	[shirtObjectID] [int] NOT NULL,
	[pantsObjectID] [int] NOT NULL,
	[uScore] [int] NOT NULL,
	[uLevel] [int] NOT NULL,
	[currency] [int] NOT NULL,
	[reputation] [int] NOT NULL,
	[health] [int] NOT NULL,
	[imagination] [int] NOT NULL,
	[armor] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharacterStats]    Script Date: 20.12.2019 16:15:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterStats](
	[statsID] [bigint] NOT NULL,
	[currencyCollected] [bigint] NOT NULL,
	[bricksCollected] [bigint] NOT NULL,
	[objectsSmashed] [bigint] NOT NULL,
	[quickbuildsCompleted] [bigint] NOT NULL,
	[enemiesSmashed] [bigint] NOT NULL,
	[rocketsUsed] [bigint] NOT NULL,
	[missionsCompleted] [bigint] NOT NULL,
	[petsTamed] [bigint] NOT NULL,
	[imaginationCollected] [bigint] NOT NULL,
	[healthCollected] [bigint] NOT NULL,
	[armorCollected] [bigint] NOT NULL,
	[distanceTraveled] [bigint] NOT NULL,
	[smashed] [bigint] NOT NULL,
	[damageTaken] [bigint] NOT NULL,
	[damageHealed] [bigint] NOT NULL,
	[armorRepaired] [bigint] NOT NULL,
	[imaginationRestored] [bigint] NOT NULL,
	[imaginationUsed] [bigint] NOT NULL,
	[distanceDriven] [bigint] NOT NULL,
	[airborneTime] [bigint] NOT NULL,
	[racingImaginationCollected] [bigint] NOT NULL,
	[racingImaginationCratesSmashed] [bigint] NOT NULL,
	[racingBoostsActivated] [bigint] NOT NULL,
	[racingWrecks] [bigint] NOT NULL,
	[racingSmashablesSmashed] [bigint] NOT NULL,
	[racesFinished] [bigint] NOT NULL,
	[racesWon] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharacterStyles]    Script Date: 20.12.2019 16:15:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterStyles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[headColor] [int] NOT NULL,
	[head] [int] NOT NULL,
	[chestColor] [int] NOT NULL,
	[chest] [int] NOT NULL,
	[legs] [int] NOT NULL,
	[hairStyle] [int] NOT NULL,
	[hairColor] [int] NOT NULL,
	[leftHand] [int] NOT NULL,
	[rightHand] [int] NOT NULL,
	[eyebrowStyle] [int] NOT NULL,
	[eyesStyle] [int] NOT NULL,
	[mouthStyle] [int] NOT NULL,
 CONSTRAINT [PK_CharacterStyles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missions]    Script Date: 20.12.2019 16:15:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missions](
	[charID] [bigint] NOT NULL,
	[missionID] [int] NOT NULL,
	[state] [int] NOT NULL,
	[progress] [text] NOT NULL,
	[repeatCount] [int] NOT NULL,
	[time] [bigint] NOT NULL,
	[chosenReward] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Characters]    Script Date: 20.12.2019 16:15:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Characters] ON [dbo].[Characters]
(
	[styleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_CharacterStyles] FOREIGN KEY([styleID])
REFERENCES [dbo].[CharacterStyles] ([id])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_CharacterStyles]
GO
EXEC sys.sp_addextendedproperty @name=N'IDENTITY_INSERT', @value=N'ON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CharacterStyles'
GO
USE [master]
GO
ALTER DATABASE [OPCRUX_GD] SET  READ_WRITE 
GO
