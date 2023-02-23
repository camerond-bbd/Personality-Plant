DROP DATABASE PersonalityPlantDB;

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
	[personalityDesc] [varchar](500) NOT NULL,
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
	[rangeBottom] [int] NOT NULL,
	[rangeTop] [int] NOT NULL
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
	[plantName] [varchar](500) NOT NULL,
	[plantDesc] [varchar](500) NOT NULL
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
	[question] [varchar](500) NULL
);
GO

ALTER TABLE [dbo].[Questions]
	ADD CONSTRAINT [PK_Question] PRIMARY KEY ([questionID])
GO

CREATE TABLE [dbo].[Options](
	[optionID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](500) NOT NULL,
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

INSERT INTO [dbo].[Scores] (rangeBottom, rangeTop)
VALUES (10, 20)

INSERT INTO [dbo].[Scores] (rangeBottom, rangeTop)
VALUES (21, 30)

INSERT INTO [dbo].[Scores] (rangeBottom, rangeTop)
VALUES (31, 40)

INSERT INTO [dbo].[Scores] (rangeBottom, rangeTop)
VALUES (41, 50)

INSERT INTO [dbo].[Scores] (rangeBottom, rangeTop)
VALUES (51, 60)

INSERT INTO [dbo].[Plants] ([plantName], [plantDesc])
VALUES  ('Zamioculcas zamiifolia', 'The perfect plant for them is the ZZ plant. This plant has shiny, dark green leaves that grow upright and can tolerate low light and drought.'),
		('Peace Lily', 'Peace Lily (Spathiphyllum) is a plant that has beautiful white flowers that symbolize peace, and it is also very easy to care for.'),
		('Snake Plant', 'The Snake Plant (Sansevieria) has long, upright leaves that are striped with shades of green and yellow. It requires minimal watering and can tolerate low light.'),
		('Bird`s Nest Fern', 'The Bird`s Nest Fern (Asplenium nidus) has beautiful, wavy fronds that resemble a bird`s nest. It requires bright, indirect light and regular watering.'),
		('Japanese Peace Lily', 'The Japanese Peace Lily (Spathiphyllum "Sensation") has beautiful white flowers and shiny, dark green leaves. It requires low to medium light and regular watering.') 
GO

INSERT INTO [dbo].[Personalities] (personalityName, personalityDesc, scoreID, plantID)
VALUES  ('The Adventurer', 'This person is always seeking new experiences and loves to explore. They need a plant that is low-maintenance and easy to care for, yet still visually interesting.', 1, 1),
		('The Nurtere', 'This person is caring, patient, and loves to take care of others. They need a plant that is easy to care for and has a lot of meaning behind it.', 2, 2),
		('The Minimalist', 'This person values simplicity and a clutter-free environment. They need a plant that is sleek and modern, with clean lines and minimal fuss. ', 3, 3),
		('The Artist', 'This person is creative, imaginative, and loves to express themselves through their work. They need a plant that is visually interesting and has a lot of character. ', 4, 4),
		('The Zen Master', 'This person values peace, balance, and harmony. They need a plant that is calming and soothing, and helps create a sense of tranquility in their home.', 5, 5)
GO

INSERT INTO [dbo].[Users] (fName, lName, eMail)
VALUES ('John', 'Smith', 'john.smith@example.com'),
       ('Emily', 'Johnson', 'emily.johnson@example.com'),
       ('Daniel', ' Lee', 'daniel.lee@example.com'),
       ('Sophia', ' Kim', 'sophia.kim@example.com'),
       ('Michael', ' Brown', 'michael.brown@example.com'),
       ('Ava', ' Davis', 'ava.davis@example.com'),
       ('William', ' Wilson', 'william.wilson@example.com'),
       ('Grace', ' Anderson', 'grace.anderson@example.com'),
       ('James', ' Martin', 'james.martin@example.com'),
       ('Olivia', ' Jackson', 'olivia.jackson@example.com'),
       ('Ethan', ' Garcia', 'ethan.garcia@example.com'),
       ('Mia', ' Martinez', 'mia.martinez@example.com'),
       ('Alexander', ' Hernandez', 'alexander.hernandez@example.com'),
       ('Isabella', ' Miller', 'isabella.miller@example.com'),
       ('Benjamin', ' Davis', 'benjamin.davis@example.com'),
       ('Evelyn', ' Rodriguez', 'evelyn.rodriguez@example.com'),
       ('Daniel', ' Wilson', 'daniel.wilson@example.com'),
       ('Sofia', ' Anderson', 'sofia.anderson@example.com'),
       ('Aiden', ' Thomas', 'aiden.thomas@example.com'),
       ('Charlotte', ' Jackson', 'charlotte.jackson@example.com'),
       ('Liam', ' Perez', 'liam.perez@example.com'),
       ('Amelia', ' Baker', 'amelia.baker@example.com'),
       ('Lucas', ' Hall', 'lucas.hall@example.com'),
       ('Chloe', ' Sanders', 'chloe.sanders@example.com'),
       ('Mason', ' Adams', 'mason.adams@example.com');
GO

INSERT INTO [dbo].[Questions] ([question])
VALUES  ('How go with the flow are you?'),
		('Hot or cold weather?'), 
		('Do you play well with others?'), 
		('Pick a color:'),
		('Water or fire?'),
		('Which of these places would you want to visit right now?'),
		('Do you get jealous easily?'),
		('What do you want most in life?'),
		('Are you bad or bougie?'),
		('Which trendy word/phrase are you most likely to say?')
GO

INSERT INTO [dbo].[Options] ([description], [pointsValue], [questionID])
VALUES  ('Very', '1', '1'),
		('Not Very TBH', '2', '1'),
		('Hot Always', '1', '2'),
		('Cold - I love getting cozy', '2', '2'),
		('um..Yes?', '1', '3'),
		('I hate people if that`s what you mean', '2', '3'),
		('Depends on my mood', '3', '3'),
		('Yellow', '1', '4'),
		('Black', '2', '4'),
		('Blue', '3', '4'),
		('Green', '4', '4'),
		('Light Blue', '5', '4'),
		('Pink', '6', '4'),
		('Agua', '1', '5'),
		('Fuego', '2', '5'),
		('Hawaii', '1', '6'),
		('Paris', '2', '6'),
		('Tokyo', '3', '6'),
		('Nah it`s not really my thing', '1', '7'),
		('I do get quite jealous, I`ll admit it', '2', '7'),
		('Depends what it`s regarding', '3', '7'),
		('Love', '1', '8'),
		('Success', '2', '8'),
		('Happiness', '3', '8'),
		('Bad', '1', '9'),
		('Bougie', '2', '9'),
		('Both', '3', '9'),
		('It`s Lit!', '1', '10'),
		('Squad Goals', '2', '10'),
		('Extra', '3', '10'),
		('On Fleek', '4', '10'),
		('I can`t even', '5', '10'),
		('Stay woke', '6', '10')
GO

INSERT INTO [dbo].[Results] ([userID], [personalityID])
VALUES  (5, 5),
		(1, 3),
		(8, 4),
		(12, 1),
		(20, 2)
GO

USE master
GO

CREATE VIEW vResults
AS
SELECT U.fName AS FirstName, U.lName AS LastName, Pe.personalityName AS Personality, Pe.personalityDesc AS PersonalityDescription, Pl.plantName AS Plant, Pl.plantDesc AS PlantDescription
FROM Results R, Users U, Personalities Pe, Plants Pl
WHERE R.userID = U.userID AND Pe.personalityID = R.personalityID AND Pe.plantID = Pl.plantID 
--AND U.userID = 20
GO

CREATE VIEW vQuestions
AS
SELECT Q.question AS Question, O.description AS Choice, O.pointsValue AS Reward
FROM Questions Q, Options O
WHERE Q.questionID = O.questionID 
--AND Q.questionID = 6
GO

CREATE PROCEDURE insertResults
	@UserID int,
	@PersonalityID int
AS
BEGIN
    INSERT INTO Results (UserID, PersonalityID)
                VALUES(@UserID, @PersonalityID)
END
GO

CREATE PROCEDURE updateResults
	@UserID int,
	@PersonalityID int
AS
BEGIN
    UPDATE Results 
        SET PersonalityID = @PersonalityID
        WHERE UserID = @UserID
END 
GO

CREATE FUNCTION [udfnumberOfUsers]
(
	@PersonalityID int
)
RETURNS int
AS
BEGIN
	DECLARE @UserCount int SELECT @UserCount = COUNT(userID)
	FROM Results
	WHERE personalityID= @PersonalityID 
	
	RETURN @UserCount 
END
GO

--SELECT * FROM [dbo].[vResults]

--SELECT * FROM [dbo].[vQuestions]

--SELECT [dbo].[udfnumberOfUsers](1) AS Numeber_Of_Users_Per_Personality

--DROP VIEW vResults

--DROP VIEW vQuestions