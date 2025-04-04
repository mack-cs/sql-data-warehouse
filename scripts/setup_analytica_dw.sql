/*
    -- Create Database 'AnalyticaDW' --

    Script Purpose:
    - Creates a new database named 'AnalyticaDW' after checking if it already exists.
    - If the database exists, it is dropped and recreated.
    - Implements schemas for the Medallion Architecture: 'bronze', 'silver', and 'gold'.

    ⚠️ Warning:
    - Running this script will **drop the entire AnalyticaDW database** if it exists.
    - **All data will be permanently lost**. Ensure you have a backup before proceeding.
*/

USE master;
GO

-- Drop database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'AnalyticaDW')
BEGIN
    ALTER DATABASE AnalyticaDW SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AnalyticaDW;
END;
GO

-- Create the 'AnalyticaDW' database
CREATE DATABASE AnalyticaDW;
GO

-- Switch to the newly created database
USE AnalyticaDW;
GO

-- Create schemas for Medallion Architecture
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

PRINT 'Database AnalyticaDW and schemas (bronze, silver, gold) have been successfully created.';
