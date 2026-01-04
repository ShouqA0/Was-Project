USE WasmDB;
GO

--???? ??????????
CREATE TABLE UserDB(
UserID INT PRIMARY KEY IDENTITY(1,1),
UserName NVARCHAR(50) NOT NULL UNIQUE,
FullName NVARCHAR(100) NOT NULL,
NationalID NVARCHAR(10) NOT NULL UNIQUE,
PhoneNumber NVARCHAR(15),
VisualPatternHash NVARCHAR(MAX) NOT NULL,

CONSTRAINT CK_UserName_EnglishOnly
CHECK (UserName NOT LIKE '%[^a-zA-Z0-9]%')

);


--???? ??????
CREATE TABLE SystemAdmins(
AdminID INT PRIMARY KEY IDENTITY(1,1),
AdminUser NVARCHAR(50) NOT NULL UNIQUE,
AdminPasswordHash NVARCHAR(MAX) NOT NULL,
AdminName NVARCHAR(100),
Email NVARCHAR(100) UNIQUE,

CONSTRAINT CK_AdminUser_EnglishOnly
CHECK (AdminUser NOT LIKE '%[^a-zA-Z0-9]%')

);


--???? ?????????
CREATE TABLE Properties (
PropertyID INT PRIMARY KEY IDENTITY(1,1),
UserID INT FOREIGN KEY REFERENCES UserDB(UserID),
Category NVARCHAR(50),
Brand NVARCHAR(50),
SerialNumber NVARCHAR(100) NOT NULL UNIQUE,
Statuss NVARCHAR(20) DEFAULT 'Safe',    --safe,lost,transferred
CreatedAt DATETIME DEFAULT GETDATE()

);

--???? ????????/?????????
CREATE TABLE LostItems (
LostItemID INT PRIMARY KEY IDENTITY(1,1),
PropertyID INT FOREIGN KEY REFERENCES Properties(PropertyID),
LostDate DATETIME DEFAULT GETDATE(),
Latitude DECIMAL(9,6),
Longitude DECIMAL(9,6),
Notes NVARCHAR(MAX)

);

