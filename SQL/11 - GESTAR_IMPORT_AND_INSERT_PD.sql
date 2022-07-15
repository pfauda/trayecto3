SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gestar_PendientesRes_PD]') AND type in (N'U'))
DROP TABLE [dbo].[Gestar_PendientesRes_PD]
GO

CREATE TABLE [dbo].[Gestar_PendientesRes_PD](
	[Periodo] [char](6) NOT NULL,
	[ID] [char](8) NOT NULL,
	[CASETYPEID] [char](4) NOT NULL,
	[CASETYPE] [varchar](120) NULL,
	[TYPE_CODSUCURSAL] [char](3) NULL,
	[STATEID] [char](2) NULL,
	[State] [varchar](10) NULL,
	[CREATEDDATE] [date] NULL,
	[DELAY_DAYS] [smallint] NULL,
	[ID_USER] [char](32) NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Gestar_PendientesRes_PD]
      ([Periodo]
      ,[ID]
      ,[CASETYPEID]
      ,[CASETYPE]
      ,[TYPE_CODSUCURSAL]
      ,[STATEID]
      ,[State]
      ,[CREATEDDATE]
      ,[DELAY_DAYS]
      ,usr.[ID_USER])
SELECT [Periodo]
      ,[ID]
      ,[CASETYPEID]
      ,[CASETYPE]
      ,[TYPE_CODSUCURSAL]
      ,[STATEID]
      ,[State]
      ,[CREATEDDATE]
      ,[DELAY_DAYS]
      ,usr.[ID_USER]
FROM [master].[dbo].[Gestar_PendientesRes]
INNER JOIN [master].[dbo].[USERS] as usr
ON usr.[DOCUMENTO] = [master].[dbo].[Gestar_PendientesRes].[CUIT]



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gestar_Complemento_PD]') AND type in (N'U'))
DROP TABLE [dbo].[Gestar_Complemento_PD]
GO

CREATE TABLE [dbo].[Gestar_Complemento_PD](
	[Periodo] [char](6) NOT NULL,
	[ID] [char](8) NOT NULL,
	[CASETYPEID] [char](4) NOT NULL,
	[CASETYPE] [varchar](120) NULL,
	[TYPE_CODSUCURSAL] [char](3) NULL,
	[STATEID] [char](2) NULL,
	[State] [varchar](10) NULL,
	[CREATEDDATE] [date] NULL,
	[ENDDATE] [date] NULL,
	[ID_USER] [char](32) NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Gestar_Complemento_PD]
      ([Periodo]
      ,[ID]
      ,[CASETYPEID]
      ,[CASETYPE]
      ,[TYPE_CODSUCURSAL]
      ,[STATEID]
      ,[State]
      ,[CREATEDDATE]
      ,[ENDDATE]
      ,usr.[ID_USER])
SELECT [Periodo]
      ,[ID]
      ,[CASETYPEID]
      ,[CASETYPE]
      ,[TYPE_CODSUCURSAL]
      ,[STATEID]
      ,[State]
      ,[CREATEDDATE]
      ,[ENDDATE]
      ,usr.[ID_USER]
FROM [master].[dbo].[Gestar_Complemento]
INNER JOIN [master].[dbo].[USERS] as usr
ON usr.[DOCUMENTO] = [master].[dbo].[Gestar_Complemento].[CUIT]

UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã¡','á')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã¤','ä')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã©','é')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'í©','é')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã³','ó')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'íº','ú')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ãº','ú')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã±','ñ')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'í‘','Ñ')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã','í')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€“','–')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€¦','...')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€“','-')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€œ','"')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€','"')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€¢','-')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€¡','c')
UPDATE [master].[dbo].[Gestar_Complemento_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Â','')
GO
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã¡','á')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã¤','ä')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã©','é')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'í©','é')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã³','ó')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'íº','ú')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ãº','ú')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã±','ñ')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'í‘','Ñ')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Ã','í')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€“','–')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€¦','...')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€“','-')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€œ','"')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€','"')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€¢','-')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'â€¡','c')
UPDATE [master].[dbo].[Gestar_PendientesRes_PD] SET [CASETYPE] = REPLACE([CASETYPE],'Â','')
GO