SET
    ANSI_NULLS ON
GO
SET
    QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERS]') AND type in (N'U'))
DROP TABLE [dbo].[USERS]
GO  
    CREATE TABLE [dbo].[USERS](
        [ID_USER] [char](32) NOT NULL,
        [EMAIL] [varchar](150) NULL,
        [FIRST_NAME] [varchar](50) NULL,
        [LAST_NAME] [varchar](50) NULL,
        [MOBILE_NUMBER] [varchar](20) NULL,
        [DOCUMENTO] [char](11) NOT NULL,
        [FECHA_CREACION] [date] NOT NULL,
        [LAST_LOGIN] [date] NOT NULL,
        [SEG_FACTOR] [char](50) NULL,
        PRIMARY KEY ([ID_USER])
    ) ON [PRIMARY]
GO
CREATE UNIQUE INDEX USERS_Documento ON [dbo].[USERS] (DOCUMENTO)
GO
INSERT INTO
    [master].[dbo].[USERS] (
        [ID_USER],
        [EMAIL],
        [FIRST_NAME],
        [LAST_NAME],
        [MOBILE_NUMBER],
        [DOCUMENTO],
        [FECHA_CREACION],
        [LAST_LOGIN],
        [SEG_FACTOR]
    )
SELECT
        usr.[ID_USER],
        usr.[EMAIL],
        usr.[FIRST_NAME],
        usr.[LAST_NAME],
        usr.[MOBILE_NUMBER],
        usr.[DOCUMENTO],
        TRY_CONVERT(DATE, usr.[FechaCreacion], 103) AS [FECHA_CREACION],
        TRY_CONVERT(DATE, usr.[LAST_LOGIN], 103) AS [LAST_LOGIN],
        usr.[SegFactor] AS [SEG_FACTOR]
FROM dbo.Import_ORA_Users as usr
WHERE usr.[ID_USER] = (
        SELECT TOP 1 dpl.ID_USER
        FROM dbo.Import_ORA_Users as dpl
        WHERE dpl.DOCUMENTO = usr.DOCUMENTO
        ORDER BY TRY_CONVERT(DATE, dpl.[LAST_LOGIN], 103) DESC 
    ) 
GO

