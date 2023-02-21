Use master;
Go

CREATE DATABASE PersonalityPlantDB;
Go


USE PersonalityPlantDB;
GO


--   Personalities 
CREATE TABLE [dbo].[Personanilities](
    [PersonalityID] [int] IDENTITY(1,1) NOT NULL,
    [PersonalityType] [varchar](120) NULL,
    [Description] [varchar](120) NULL
);
GO

-- Plants
CREATE TABLE [dbo].[Plants](
    [PlantID] [int] IDENTITY(1,1) NOT NULL,
    [PlantName] [varchar](120) NULL,
    [Description] [varchar](120) NULL,
	[PersonalityID] [int] FOREIGN KEY REFERENCES Personalities(PersonalityID)
);
GO

-- Users
CREATE TABLE [dbo].[Users](
    [UserID] [int] IDENTITY(1,1) NOT NULL,
    [UserName] [varchar](120) NULL,
    [Email] [varchar](120) NULL,
);
GO

-- User Plants   ( add Plant ID to Users Table or have this table)
CREATE TABLE [dbo].[User_Plants](
    [UserPlantID] [int] IDENTITY (1,1) NOT NULL,
    [UserName] [varchar](120) NULL,
);
GO

-- Questions
CREATE TABLE [dbo].[Questions](
    [QuestionID] [int] IDENTITY (1,1) NOT NULL,
    [QuestionType] [varchar](120) NULL,
    [Question] [varchar](120) NULL,
);
GO

-- User_Answers
CREATE TABLE [dbo].[UserAnswers](
    [AnswerID] [int] IDENTITY (1,1) NOT NULL,
    [UserID] [int] FOREIGN KEY REFERENCES Users(UserID),
	[QuestionID] [int] FOREIGN KEY REFERENCES Questions(QuestionID),
    [Answer] [varchar](120)  NULL,
	[AnswerCode] [Varchar] (120) NULL,
);
GO

------ inserting into tables Users and Plants

-- Users
INSERT INTO [dbo].[Users]
           ( [UserName],
             [Email] 
           )

VALUES('Kiernan Ace','ka234@gmail.co.za'),
  ('Bonga Man','bman@gmail.co.za'),
  ('Cameron Gent','cgent@gmail.co.za'),
  ('Sbuda','buda@plantis.co.za'),
  ('Mariam Lee','Mlee@bbd.co.za'),
  ('Gugu','Gugulethu@gmail.co.za')
GO


--- Plants
INSERT INTO [dbo].[Plants]
           ( [PlantName],
             [Description] 
           )

VALUES('spider plant','The social butterfly'),
  ('Miltonia orchid','The type A'),
  ('pothos','The traveler'),
  ('peace lily','The dreamer'),
  ('aloe vera','The zero-waster'),
  ('barrel cactus','The curmudgeon')
GO

-- Adding Foreign Key Constraints to Users, PLants and Remaing Tables

ALTER TABLE dbo.Users
ADD CONSTRAINT [FK_UsersPlantID] FOREIGN KEY  (PlantID) REFERENCES lants (PlantID);

ALTER TABLE dbo.Plants
ADD CONSTRAINT [FK_PlantsPersonalityID] FOREIGN KEY  (PersonalityID) REFERENCES Personalities (PersonalityID);

ALTER TABLE dbo.User_Answers
ADD CONSTRAINT [FK_User_AnswersUserID] FOREIGN KEY  (UserID) REFERENCES Users (UserID);

ALTER TABLE dbo.User_Answers
ADD CONSTRAINT [FK_User_AnswersQuestionID] FOREIGN KEY  (QuestionID) REFERENCES Questions (QuestionID);


ALTER TABLE dbo.User_Answers
ADD CONSTRAINT [FK_User_AnswersAnswerID] FOREIGN KEY  (AnswerID) REFERENCES Answers (AnswerID);


----- Miscelaneous Data/fields such as pics 