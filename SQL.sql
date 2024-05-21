CREATE DATABASE FUSWAPSHAREFREE


CREATE TABLE StatusPost
(
    StatusID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL,
);

CREATE TABLE Category
(
  CategoryID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] NVARCHAR(255) NOT NULL,
);

CREATE TABLE [Role]
(
  RoleID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] NVARCHAR(255) NOT NULL,
);

CREATE TABLE StatusUser
(
  StatusID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] NVARCHAR(255) NOT NULL,
);

CREATE TABLE Quanlity
(
  QuanlityID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] VARCHAR(255) NOT NULL,
);

CREATE TABLE [Type]
(
  TypeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Name] NVARCHAR(255) NOT NULL,
);

CREATE TABLE [User]
(
  UserID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Email NVARCHAR(255) NOT NULL,
  Phone NVARCHAR(32) NOT NULL,
  AvatarUrl NVARCHAR(2000),
  [PassWord] NVARCHAR(255) NOT NULL,
  JoinDate DATETIME NOT NULL,
  UserName NVARCHAR(255) NOT NULL,
  Full_Name NVARCHAR(255) NOT NULL,
  District NVARCHAR(255) NOT NULL,
  Commune NVARCHAR(255) NOT NULL,
  StreetNumber NVARCHAR(255),
  Point INT,
  RoleID INT NOT NULL,
  StatusID INT NOT NULL,
  FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
  FOREIGN KEY (StatusID) REFERENCES StatusUser(StatusID)
);

CREATE TABLE Post
(
  PostID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Title NVARCHAR(255) NOT NULL,
  Description NVARCHAR(2000) NOT NULL,
  intructions NVARCHAR(2000) NOT NULL,
  ExpiresDate DATETIME NOT NULL,
  ImageUrl NVARCHAR(2000) NOT NULL,
  Desire NVARCHAR(2000),
  Commune NVARCHAR(255) NOT NULL,
  District NVARCHAR(255) NOT NULL,
  Street_Number NVARCHAR(255) NOT NULL,
  CreateTime DATETIME NOT NULL,
  UserID INT NOT NULL,
  StatusID INT NOT NULL,
  QuanlityID INT NOT NULL,
  TypeID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES [User](UserID),
  FOREIGN KEY (StatusID) REFERENCES StatusPost(StatusID),
  FOREIGN KEY (QuanlityID) REFERENCES Quanlity(QuanlityID),
  FOREIGN KEY (TypeID) REFERENCES Type(TypeID)
);

CREATE TABLE Request
(
  requestTIme DATETIME NOT NULL,
  Message NVARCHAR(2000),
  Status NVARCHAR(255) NOT NULL,
  UserID INT NOT NULL,
  PostID INT NOT NULL,
  PRIMARY KEY (UserID, PostID),
  FOREIGN KEY (UserID) REFERENCES [User](UserID),
  FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE [View]
(
  UserID INT NOT NULL,
  PostID INT NOT NULL,
  PRIMARY KEY (UserID, PostID),
  FOREIGN KEY (UserID) REFERENCES [User](UserID),
  FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE Have_Category
(
  PostID INT NOT NULL,
  CategoryID INT NOT NULL,
  PRIMARY KEY (PostID, CategoryID),
  FOREIGN KEY (PostID) REFERENCES Post(PostID),
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE BlockList
(
  UserID INT NOT NULL,
  BlockUserID INT NOT NULL,
  PRIMARY KEY (UserID, BlockUserID),
  FOREIGN KEY (UserID) REFERENCES [User](UserID),
  FOREIGN KEY (BlockUserID) REFERENCES [User](UserID)
);



INSERT INTO StatusPost ([Name])
VALUES
('Available'),
('Pick Up Arranged'),
('Expired'),
('Unlisted');

INSERT INTO Category ([Name])
VALUES
('Furniture'),
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Toys'),
('Jewelry'),
('Tools'),
('Musical Instruments'),
('Kitchenware'),
('Gardening Tools'),
('Office Supplies'),
('Pet Supplies'),
('Baby Products'),
('Outdoor Equipment'),
('Vintage Items'),
('Craft Supplies');

INSERT INTO Role ([Name])
VALUES
('User'),
('Admin');

INSERT INTO StatusUser ([Name])
VALUES
('Active'),
('Banned');

INSERT INTO Quanlity ([Name])
VALUES
('Used'),
('Needs Repair'),
('New');

INSERT INTO [Type] ([Name])
VALUES
('Exchange'),
('Free');