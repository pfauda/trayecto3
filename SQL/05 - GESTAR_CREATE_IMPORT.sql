SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Import_Gestar_Complemento]') AND type in (N'U'))
DROP TABLE [dbo].[Gestar_Complemento_202202]
GO
CREATE TABLE [dbo].[Import_Gestar_Complemento](
	[Periodo] [varchar](6) NOT NULL,
	[ID] [varchar](8) NOT NULL,
	[CASETYPEID] [varchar](4) NULL,
	[CASETYPE] [varchar](110) NULL,
	[TYPE_CODSUCURSAL] [varchar](50) NULL,
	[STATEID] [varchar](50) NULL,
	[State] [varchar](10) NULL,
	[CREATEDDATE] [varchar](8) NULL,
	[CREATEDMONTH] [varchar](8) NULL,
	[ENDDATE] [varchar](8) NULL,
	[CUIT] [varchar](11) NULL,
	[CUSTOMER] [varchar](50) NULL,
	[SOLVER] [varchar](34) NULL,
	[Historico] [varchar](max) NULL,
	[Comentario_Solucion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
