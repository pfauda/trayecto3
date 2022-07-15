/*
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trx_PD]') AND type in (N'U'))
DROP TABLE [dbo].[Trx_PD]
GO
CREATE TABLE [dbo].[Trx_PD](
    [PERIODO] [char](6) NOT NULL,
    [ID_USER] [char](32) NOT NULL,
    [TIPO_CANAL] [char](20) NULL,
    [CANAL] [char](20) NULL,
    [GRUPO_OPERACION] [char](25) NULL,
    [TIPO_OPERACION] [char](22) NULL,
    [ORIGEN] [char](6) NULL,
    [CLASIF_TRX] [char](16) NULL,
    [ES_TIPO_TRX_MONETARIA] [smallint] NULL,
    [ES_CANAL_RATIO_DIGITAL] [smallint] NULL,
    [IMPORTE] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
CREATE INDEX ix_Trx_PD
ON [dbo].[Trx_PD]([PERIODO], [ID_USER]);
GO
*/

INSERT INTO
	[master].[dbo].[Trx_PD] (
        [PERIODO],
        [ID_USER],
        [TIPO_CANAL],
        [CANAL],
        [GRUPO_OPERACION],
        [TIPO_OPERACION],
        [ORIGEN],
        [CLASIF_TRX],
        [ES_TIPO_TRX_MONETARIA],
        [ES_CANAL_RATIO_DIGITAL],
        [IMPORTE]
	)
SELECT
	[PERIODO],
    [ID_USER],
	[TIPO_CANAL],
	[CANAL],
	[GRUPO_OPERACION],
	[TIPO_OPERACION],
	[ORIGEN],
	[CLASIF_TRX],
	IIF([TIPO_TRX] = 'MONETARIAS', 1, 0) AS [ES_TIPO_TRX_MONETARIA],
	IIF([CANAL_RATIO] = 'DIGITAL', 1, 0) AS [ES_CANAL_RATIO_DIGITAL],
	[IMPORTE]
FROM
	[master].[dbo].[Import_Trx_Monetarias]
	INNER JOIN [master].[dbo].[USERS] ON [master].[dbo].[USERS].[DOCUMENTO] = [master].[dbo].[Import_Trx_Monetarias].[CUITCLIE]
	WHERE [TIPO_CLIENTE] = 'INDIVIDUO'
