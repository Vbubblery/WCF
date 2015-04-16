
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/07/2015 11:43:43
-- Generated from EDMX file: C:\Users\157292_000\Documents\Visual Studio 2013\Projects\Synchronic World\Synchronic World\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [synchronic];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EventEventType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventSet] DROP CONSTRAINT [FK_EventEventType];
GO
IF OBJECT_ID(N'[dbo].[FK_EventEventStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventSet] DROP CONSTRAINT [FK_EventEventStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_ContributionTypeContribution]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContributionSet] DROP CONSTRAINT [FK_ContributionTypeContribution];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonContribution]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContributionSet] DROP CONSTRAINT [FK_PersonContribution];
GO
IF OBJECT_ID(N'[dbo].[FK_EventContribution]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ContributionSet] DROP CONSTRAINT [FK_EventContribution];
GO

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
IF OBJECT_ID(N'[dbo].[ContributionTypeSet1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ContributionTypeSet1];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PersonSet'
CREATE TABLE [dbo].[PersonSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [NickName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EventSet'
CREATE TABLE [dbo].[EventSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Time] datetime  NOT NULL,
    [EventType_Id] int  NOT NULL,
    [EventStatus_Id] int  NOT NULL
);
GO

-- Creating table 'EventTypeSet'
CREATE TABLE [dbo].[EventTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NameOfType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EventStatusSet'
CREATE TABLE [dbo].[EventStatusSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] int  NOT NULL
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

-- Creating table 'ContributionTypeSet1'
CREATE TABLE [dbo].[ContributionTypeSet1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NameOfType] nvarchar(max)  NOT NULL
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

-- Creating primary key on [Id] in table 'ContributionTypeSet1'
ALTER TABLE [dbo].[ContributionTypeSet1]
ADD CONSTRAINT [PK_ContributionTypeSet1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EventType_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_EventEventType]
    FOREIGN KEY ([EventType_Id])
    REFERENCES [dbo].[EventTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEventType'
CREATE INDEX [IX_FK_EventEventType]
ON [dbo].[EventSet]
    ([EventType_Id]);
GO

-- Creating foreign key on [EventStatus_Id] in table 'EventSet'
ALTER TABLE [dbo].[EventSet]
ADD CONSTRAINT [FK_EventEventStatus]
    FOREIGN KEY ([EventStatus_Id])
    REFERENCES [dbo].[EventStatusSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEventStatus'
CREATE INDEX [IX_FK_EventEventStatus]
ON [dbo].[EventSet]
    ([EventStatus_Id]);
GO

-- Creating foreign key on [ContributionType_Id] in table 'ContributionSet'
ALTER TABLE [dbo].[ContributionSet]
ADD CONSTRAINT [FK_ContributionTypeContribution]
    FOREIGN KEY ([ContributionType_Id])
    REFERENCES [dbo].[ContributionTypeSet1]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContributionTypeContribution'
CREATE INDEX [IX_FK_ContributionTypeContribution]
ON [dbo].[ContributionSet]
    ([ContributionType_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'ContributionSet'
ALTER TABLE [dbo].[ContributionSet]
ADD CONSTRAINT [FK_PersonContribution]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[PersonSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonContribution'
CREATE INDEX [IX_FK_PersonContribution]
ON [dbo].[ContributionSet]
    ([Person_Id]);
GO

-- Creating foreign key on [Event_Id] in table 'ContributionSet'
ALTER TABLE [dbo].[ContributionSet]
ADD CONSTRAINT [FK_EventContribution]
    FOREIGN KEY ([Event_Id])
    REFERENCES [dbo].[EventSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventContribution'
CREATE INDEX [IX_FK_EventContribution]
ON [dbo].[ContributionSet]
    ([Event_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------