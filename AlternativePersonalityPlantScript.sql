CREATE DATABASE PersonalityPlantDB;
GO

USE PersonalityPlantDB;
GO

CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](120) NOT NULL,
	[lName] [varchar](120) NOT NULL,
	[eMail] [varchar](120) NOT NULL
);
GO

ALTER TABLE [dbo].[Users]
	ADD CONSTRAINT [PK_User] PRIMARY KEY ( [userID] )
GO

CREATE TABLE [dbo].[Personalities](
	[personalityID] [int] IDENTITY(1,1) NOT NULL,
	[personalityName] [varchar](120) NOT NULL,
	[personalityDesc] [varchar](120) NOT NULL,
	[scoreID] [int] NOT NULL,
	[plantID] [int] NOT NULL,
);
GO

ALTER TABLE [dbo].[Personalities]
	ADD CONSTRAINT [PK_Personalities] PRIMARY KEY ([personalityID])
GO

CREATE TABLE [dbo].[Results](
	[resultsID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[personalityID] [int] NOT NULL,
);
GO

ALTER TABLE [dbo].[Results]
	ADD CONSTRAINT [PK_Results] PRIMARY KEY ([resultsID])
GO

ALTER TABLE [dbo].[Results]
	ADD CONSTRAINT [FK_User]
	FOREIGN KEY ( [userID] ) REFERENCES [dbo].[Users] ( [userID] )
GO

ALTER TABLE [dbo].[Results]
	ADD CONSTRAINT [FK_Personalities]
	FOREIGN KEY ( [personalityID] ) REFERENCES [dbo].[Personalities] ( [personalityID] )
GO

CREATE TABLE [dbo].[Scores](
	[scoreID] [int] IDENTITY(1,1) NOT NULL,
	[rangeBottom] [int] NOT NULL
);
GO

ALTER TABLE [dbo].[Scores]
	ADD CONSTRAINT [PK_Score] PRIMARY KEY ([scoreID])
GO

ALTER TABLE [dbo].[Personalities]
	ADD CONSTRAINT [FK_Score]
	FOREIGN KEY ( [scoreID] ) REFERENCES [dbo].[Scores] ( [scoreID] )
GO

CREATE TABLE [dbo].[Plants](
	[plantID] [int] IDENTITY(1,1) NOT NULL,
	[plantName] [varchar](120) NOT NULL,
	[plantDesc] [varchar](120) NOT NULL
);
GO

ALTER TABLE [dbo].[Plants]
	ADD CONSTRAINT [PK_Plant] PRIMARY KEY ([plantID])
GO

ALTER TABLE [dbo].[Personalities]
	ADD CONSTRAINT [FK_Plant]
	FOREIGN KEY ( [plantID] ) REFERENCES [dbo].[Plants] ( [plantID] )
GO

CREATE TABLE [dbo].[Questions](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](120) NULL
);
GO

ALTER TABLE [dbo].[Questions]
	ADD CONSTRAINT [PK_Question] PRIMARY KEY ([questionID])
GO

CREATE TABLE [dbo].[Options](
	[optionID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](120) NOT NULL,
	[pointsValue] [int] NOT NULL,
	[questionID] [int] NOT NULL
);
GO

ALTER TABLE [dbo].[Options]
	ADD CONSTRAINT [PK_Option] PRIMARY KEY ([optionID])
GO

ALTER TABLE [dbo].[Options]
	ADD CONSTRAINT [FK_Question]
	FOREIGN KEY ( [questionID] ) REFERENCES [dbo].[Questions] ( [questionID] )
GO

USE master
GO