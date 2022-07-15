SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Trx_Monetarias](
	[PERIODO] [varchar](50) NULL,
	[TIPO_CANAL] [varchar](50) NULL,
	[CANAL] [varchar](50) NULL,
	[CUITCLIE] [varchar](50) NULL,
	[GRUPO_OPERACION] [varchar](50) NULL,
	[TIPO_OPERACION] [varchar](50) NULL,
	[TIPO_OPERACION2] [varchar](50) NULL,
	[OPERACION] [varchar](50) NULL,
	[SUCURSAL] [varchar](50) NULL,
	[CAB] [varchar](50) NULL,
	[IMPORTE] [varchar](50) NULL,
	[ORIGEN] [varchar](50) NULL,
	[TIPO_TRX] [varchar](50) NULL,
	[CANAL_RATIO] [varchar](50) NULL,
	[CLASIF_TRX] [varchar](50) NULL
) ON [PRIMARY]
GO

SELECT [PERIODO]
      ,[TIPO_CANAL]
      ,[CANAL]
      ,[ID_USER]
      ,[GRUPO_OPERACION]
      ,[TIPO_OPERACION]
      ,[TIPO_OPERACION2]
      ,[OPERACION]
      ,[SUCURSAL]
      ,[IMPORTE]
      ,[ORIGEN]
      ,[CANAL_RATIO]
      ,[CLASIF_TRX]
  FROM [master].[dbo].[Detalle_Trx_Monetarias]

ALTER TABLE [master].[dbo].[Detalle_Trx_Monetarias]
DROP COLUMN CAB, TIPO_TRX;

INSERT INTO [master].[dbo].[Detalle_Trx_Monetarias]
    (PERIODO,
     TIPO_CANAL,
     CANAL,
     ID_USER,
     GRUPO_OPERACION,
     TIPO_OPERACION,
     TIPO_OPERACION2,
     OPERACION,
     SUCURSAL,
     CAB,
     IMPORTE,
     ORIGEN,
     TIPO_TRX,
     CANAL_RATIO,
     CLASIF_TRX)
SELECT trx2.PERIODO
      ,trx2.TIPO_CANAL
      ,trx2.CANAL
      ,usr.ID_USER
      ,trx2.GRUPO_OPERACION
      ,trx2.TIPO_OPERACION
      ,trx2.TIPO_OPERACION2
      ,trx2.OPERACION
      ,trx2.SUCURSAL
      ,trx2.CAB
      ,trx2.IMPORTE
      ,trx2.ORIGEN
      ,trx2.TIPO_TRX
      ,trx2.CANAL_RATIO
      ,trx2.CLASIF_TRX
  FROM [master].[dbo].[Detalle_Trx_Monetarias_202202] AS trx2
  inner JOIN [master].[dbo].[ORA_Users] AS usr
  ON usr.DOCUMENTO = trx2.CUITCLIE
  WHERE trx2.TIPO_CLIENTE = 'INDIVIDUO'
UNION
SELECT trx3.PERIODO
      ,trx3.TIPO_CANAL
      ,trx3.CANAL
      ,usr.ID_USER
      ,trx3.GRUPO_OPERACION
      ,trx3.TIPO_OPERACION
      ,trx3.TIPO_OPERACION2
      ,trx3.OPERACION
      ,trx3.SUCURSAL
      ,trx3.CAB
      ,trx3.IMPORTE
      ,trx3.ORIGEN
      ,trx3.TIPO_TRX
      ,trx3.CANAL_RATIO
      ,trx3.CLASIF_TRX
  FROM [master].[dbo].[Detalle_Trx_Monetarias_202203] AS trx3
  inner JOIN [master].[dbo].[ORA_Users] AS usr
  ON usr.DOCUMENTO = trx3.CUITCLIE
  WHERE trx3.TIPO_CLIENTE = 'INDIVIDUO'
UNION
SELECT trx4.PERIODO
      ,trx4.TIPO_CANAL
      ,trx4.CANAL
      ,usr.ID_USER
      ,trx4.GRUPO_OPERACION
      ,trx4.TIPO_OPERACION
      ,trx4.TIPO_OPERACION2
      ,trx4.OPERACION
      ,trx4.SUCURSAL
      ,trx4.CAB
      ,trx4.IMPORTE
      ,trx4.ORIGEN
      ,trx4.TIPO_TRX
      ,trx4.CANAL_RATIO
      ,trx4.CLASIF_TRX
  FROM [master].[dbo].[Detalle_Trx_Monetarias_202204] AS trx4
  inner JOIN [master].[dbo].[ORA_Users] AS usr
  ON usr.DOCUMENTO = trx4.CUITCLIE
  WHERE trx4.TIPO_CLIENTE = 'INDIVIDUO'

SELECT TOP 1000
        PERIODO,
        TIPO_CANAL,
        CANAL,
        CUITCLIE,
        GRUPO_OPERACION,
        TIPO_OPERACION,
        TIPO_OPERACION2,
        OPERACION,
        SUCURSAL,
        CAB,
        IMPORTE,
        ORIGEN,
        TIPO_TRX,
        CANAL_RATIO,
        CLASIF_TRX
  FROM [master].[dbo].[Detalle_Trx_Monetarias]

  SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Detalle_Trx_Monetarias](
	[PERIODO] [varchar](50) NULL,
	[TIPO_CANAL] [varchar](50) NULL,
	[CANAL] [varchar](50) NULL,
	[CUITCLIE] [varchar](50) NULL,
	[GRUPO_OPERACION] [varchar](50) NULL,
	[TIPO_OPERACION] [varchar](50) NULL,
	[TIPO_OPERACION2] [varchar](50) NULL,
	[OPERACION] [varchar](50) NULL,
	[SUCURSAL] [varchar](50) NULL,
	[CAB] [varchar](50) NULL,
	[IMPORTE] [varchar](50) NULL,
	[ORIGEN] [varchar](50) NULL,
	[TIPO_TRX] [varchar](50) NULL,
	[CANAL_RATIO] [varchar](50) NULL,
	[CLASIF_TRX] [varchar](50) NULL
) ON [PRIMARY]
GO


INSERT INTO [master].[dbo].[Detalle_Trx_NoMonetarias]
    (PERIODO,
     TIPO_CANAL,
     CANAL,
     ID_USER,
     GRUPO_OPERACION,
     TIPO_OPERACION,
     TIPO_OPERACION2,
     SUCURSAL,
     IMPORTE,
     ORIGEN,
     CANAL_RATIO,
     CLASIF_TRX)
SELECT trx2.PERIODO
      ,trx2.TIPO_CANAL
      ,trx2.CANAL
      ,usr.ID_USER
      ,trx2.GRUPO_OPERACION
      ,trx2.TIPO_OPERACION
      ,trx2.TIPO_OPERACION2
      ,trx2.SUCURSAL
      ,trx2.IMPORTE
      ,trx2.ORIGEN
      ,trx2.CANAL_RATIO
      ,trx2.TIPO_TRX
  FROM [master].[dbo].[Detalle_Trx_NoMonetarias_202202] AS trx2
  inner JOIN [master].[dbo].[ORA_Users] AS usr
  ON usr.DOCUMENTO = trx2.CUITCLIE
  WHERE trx2.TIPO_CLIENTE = 'INDIVIDUO'
UNION
SELECT trx3.PERIODO
      ,trx3.TIPO_CANAL
      ,trx3.CANAL
      ,usr.ID_USER
      ,trx3.GRUPO_OPERACION
      ,trx3.TIPO_OPERACION
      ,trx3.TIPO_OPERACION2
      ,trx3.SUCURSAL
      ,trx3.IMPORTE
      ,trx3.ORIGEN
      ,trx3.CANAL_RATIO
      ,trx3.TIPO_TRX
  FROM [master].[dbo].[Detalle_Trx_NoMonetarias_202203] AS trx3
  inner JOIN [master].[dbo].[ORA_Users] AS usr
  ON usr.DOCUMENTO = trx3.CUITCLIE
  WHERE trx3.TIPO_CLIENTE = 'INDIVIDUO'
UNION
SELECT trx4.PERIODO
      ,trx4.TIPO_CANAL
      ,trx4.CANAL
      ,usr.ID_USER
      ,trx4.GRUPO_OPERACION
      ,trx4.TIPO_OPERACION
      ,trx4.TIPO_OPERACION2
      ,trx4.SUCURSAL
      ,trx4.IMPORTE
      ,trx4.ORIGEN
      ,trx4.CANAL_RATIO
      ,trx4.TIPO_TRX
  FROM [master].[dbo].[Detalle_Trx_NoMonetarias_202204] AS trx4
  inner JOIN [master].[dbo].[ORA_Users] AS usr
  ON usr.DOCUMENTO = trx4.CUITCLIE
  WHERE trx4.TIPO_CLIENTE = 'INDIVIDUO'
