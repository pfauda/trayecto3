IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gestar_Complemento]') AND type in (N'U'))
DROP TABLE [dbo].[Gestar_Complemento]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [master].[dbo].[Gestar_Complemento](
	[Periodo] [char](6) NOT NULL,
	[ID] [char](8) NOT NULL,
	[CASETYPEID] [char](4) NOT NULL,
	[CASETYPE] [varchar](150) NULL,
	[TYPE_CODSUCURSAL] [char](3) NULL,
	[STATEID] [char](2) NULL,
	[State] [varchar](10) NULL,
	[CREATEDDATE] [date] NULL,
	[ENDDATE] [date] NULL,
	[CUIT] [char](11) NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Gestar_Complemento]
      ([Periodo],
       [ID],
       [CASETYPEID],
       [CASETYPE],
       [TYPE_CODSUCURSAL],
       [STATEID],
       [State],
       [CREATEDDATE],
       [ENDDATE],
       [CUIT])
SELECT cmp.[Periodo]
      ,cmp.[ID]
      ,cmp.[CASETYPEID]
      ,cmp.[CASETYPE]
      ,cmp.[TYPE_CODSUCURSAL]
      ,cmp.[STATEID]
      ,cmp.[State]
      ,TRY_CONVERT(DATE, cmp.[CREATEDDATE]) AS [CREATEDDATE]
      ,TRY_CONVERT(DATE, cmp.[ENDDATE]) AS [ENDDATE]
      ,IIF(LEFT(cmp.[CUIT], 3) = '000', SUBSTRING(cmp.[CUIT], 4, 11), SUBSTRING(cmp.[CUIT], 1, 11)) AS [CUIT]
FROM [master].[dbo].[Import_Gestar_Complemento] AS cmp
WHERE cmp.CUIT <> ''
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gestar_PendientesRes]') AND type in (N'U'))
DROP TABLE [dbo].[Gestar_PendientesRes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gestar_PendientesRes](
	[Periodo] [char](6) NOT NULL,
	[ID] [char](8) NOT NULL,
	[CASETYPEID] [char](4) NOT NULL,
	[CASETYPE] [varchar](120) NULL,
	[TYPE_CODSUCURSAL] [char](3) NULL,
	[STATEID] [char](2) NULL,
	[State] [varchar](10) NULL,
	[CREATEDDATE] [date] NULL,
	[DELAY_DAYS] [smallint] NULL,
	[CUIT] [char](11) NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Gestar_PendientesRes]
      ([Periodo],
       [ID],
       [CASETYPEID],
       [CASETYPE],
       [TYPE_CODSUCURSAL],
       [STATEID],
       [State],
       [CREATEDDATE],
       [DELAY_DAYS],
       [CUIT])
SELECT res.[Periodo]
      ,res.[ID]
      ,res.[CASETYPEID]
      ,res.[CASETYPE]
      ,res.[TYPE_CODSUCURSAL]
      ,res.[STATEID]
      ,res.[State]
      ,TRY_CONVERT(DATE, res.[CREATEDDATE]) AS [CREATEDDATE]
      ,res.[DELAY_DAYS]
      ,IIF(LEFT(res.[CUIT], 3) = '000', SUBSTRING(res.[CUIT], 4, 11), SUBSTRING(res.[CUIT], 1, 11)) AS [CUIT]
FROM [master].[dbo].[Import_Gestar_PendientesRes] AS res
WHERE res.CUIT <> ''
GO
