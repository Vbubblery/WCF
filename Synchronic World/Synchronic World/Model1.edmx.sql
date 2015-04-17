
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/17/2015 14:33:56
-- Generated from EDMX file: C:\Users\157292_000\Desktop\Synchronic World\Synchronic World\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [newsynchronic];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[PersonSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonSet];
GO
IF OBJECT_ID(N'[dbo].[EventSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventSet];
GO
IF OBJECT_ID(N'[dbo].[EventTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventTypeSet];
GO
IF OBJECT_ID(N'[dbo].[EventStatusSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventStatusSet];
GO
IF OBJECT_ID(N'[dbo].[ContributionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContributionSet];
GO
IF OBJECT_ID(N'[dbo].[ContributionTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContributionTypeSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PersonSet'
CREATE TABLE [dbo].[PersonSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [NickName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'EventSet'
CREATE TABLE [dbo].[EventSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Time] nvarchar(max)  NOT NULL,
    [EventType_Id] int  NOT NULL,
    [EventStatus_Id] int  NOT NULL
);
GO

-- Creating table 'EventTypeSet'
CREATE TABLE [dbo].[EventTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EventStatusSet'
CREATE TABLE [dbo].[EventStatusSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] smallint  NOT NULL
);
GO

-- Creating table 'ContributionSet'
CREATE TABLE [dbo].[ContributionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Quantity] float  NOT NULL,
    [ContributionType_Id] int  NOT NULL,
    [Person_Id] int  NOT NULL,
    [Event_Id] int  NOT NULL
);
GO

-- Creating table 'ContributionTypeSet'
CREATE TABLE [dbo].[ContributionTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'PersonSet'
ALTER TABLE [dbo].[PersonSet]
ADD CONSTRAINT [PK_PersonSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [PK_EventSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EventTypeSet'
ALTER TABLE [dbo].[EventTypeSet]
ADD CONSTRAINT [PK_EventTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EventStatusSet'
ALTER TABLE [dbo].[EventStatusSet]
ADD CONSTRAINT [PK_EventStatusSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContributionSet'
ALTER TABLE [dbo].[ContributionSet]
ADD CONSTRAINT [PK_ContributionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ContributionTypeSet'
ALTER TABLE [dbo].[ContributionTypeSet]
ADD CONSTRAINT [PK_ContributionTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------