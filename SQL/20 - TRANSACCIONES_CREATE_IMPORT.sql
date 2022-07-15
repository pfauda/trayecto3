DROP TABLE [dbo].[Import_Trx_Monetarias]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_Trx_Monetarias](
	[PERIODO] [varchar](6) NOT NULL,
	[TIPO_CANAL] [varchar](20) NOT NULL,
	[CANAL] [varchar](50) NOT NULL,
	[TIPO_CLIENTE] [varchar](10) NOT NULL,
	[CUITCLIE] [varchar](11) NOT NULL,
	[GRUPO_OPERACION] [varchar](50) NULL,
	[TIPO_OPERACION] [varchar](15) NULL,
	[TIPO_OPERACION2] [varchar](50) NULL,
	[OPERACION] [varchar](150) NULL,
	[SUCURSAL] [varchar](3) NULL,
	[CAB] [varchar](20) NULL,
	[IMPORTE] [real] NULL,
	[ORIGEN] [varchar](20) NULL,
	[TIPO_TRX] [varchar](15) NULL,
	[CANAL_RATIO] [varchar](20) NULL,
	[CLASIF_TRX] [varchar](20) NULL
) ON [PRIMARY]
GO
