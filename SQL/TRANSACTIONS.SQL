SET
	ANSI_NULLS ON
GO
SET
	QUOTED_IDENTIFIER ON

GO
	CREATE TABLE [dbo].[Detalle_Trx_TMP](
		[PERIODO] [char](6) NOT NULL,
		[ID_USER] [char](32) NOT NULL,
		[TIPO_CANAL] [char](20) NULL,
		[CANAL] [char](20) NULL,
		[TIPO_CLIENTE] [char](9) NULL,
		[GRUPO_OPERACION] [char](25) NULL,
		[TIPO_OPERACION] [char](22) NULL,
		[TIPO_OPERACION2] [char](20) NULL,
		[OPERACION] [varchar](255) NULL,
		[SUCURSAL] [char](3) NULL,
		[CAB] [char](4) NULL,
		[IMPORTE] [numeric](18, 2) NULL,
		[ORIGEN] [char](6) NULL,
		[TIPO_TRX] [char](13) NULL,
		[CANAL_RATIO] [char](7) NULL,
		[CLASIF_TRX] [char](16) NULL
	) ON [PRIMARY]
GO

	CREATE TABLE [dbo].[Detalle_Trx](
		[PERIODO] [char](6) NOT NULL,
		[TIPO_CANAL] [char](20) NULL,
		[CANAL] [char](20) NULL,
		[ID_USER] [char](32) NOT NULL,
		[GRUPO_OPERACION] [char](25) NULL,
		[TIPO_OPERACION] [char](22) NULL,
		[TIPO_OPERACION2] [char](20) NULL,
		[SUCURSAL] [char](3) NULL,
		[CAB] [char](4) NULL,
		[IMPORTE] [numeric](18, 2) NULL,
		[ORIGEN] [char](6) NULL,
		[ES_TIPO_TRX_MONETARIA] [bit] NULL,
		[ES_CANAL_RATIO_DIGITAL] [bit] NULL,
		[CLASIF_TRX] [char](16) NULL
	) ON [PRIMARY]
GO


DELETE FROM
	[master].[dbo].[Detalle_Trx]
GO
INSERT INTO
	[master].[dbo].[Detalle_Trx] (
		[PERIODO],
		[TIPO_CANAL],
		[CANAL],
		[ID_USER],
		[GRUPO_OPERACION],
		[TIPO_OPERACION],
		[TIPO_OPERACION2],
		[SUCURSAL],
		[CAB],
		[IMPORTE],
		[ORIGEN],
		[ES_TIPO_TRX_MONETARIA],
		[ES_CANAL_RATIO_DIGITAL],
		[CLASIF_TRX]
	)
SELECT
	[PERIODO],
	[TIPO_CANAL],
	[CANAL],
	[ID_USER],
	[GRUPO_OPERACION],
	[TIPO_OPERACION],
	[TIPO_OPERACION2],
	[SUCURSAL],
	[CAB],
	CAST(REPLACE([IMPORTE], ',', '.') AS NUMERIC(18, 2)) AS [IMPORTE],
	[ORIGEN],
	IIF([TIPO_TRX] = 'MONETARIAS', 1, 0) AS [ES_TIPO_TRX_MONETARIA],
	IIF([CANAL_RATIO] = 'DIGITAL', 1, 0) AS [ES_CANAL_RATIO_DIGITAL],
	[CLASIF_TRX]
FROM
	[master].[dbo].[Detalle_Trx_Monetarias2]
	INNER JOIN [master].[dbo].[ORA_Users] ON [master].[dbo].[ORA_Users].[DOCUMENTO] = [master].[dbo].[Detalle_Trx_Monetarias2].[CUITCLIE]
	WHERE [TIPO_CLIENTE] = 'INDIVIDUO'