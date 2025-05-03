USE [AccountDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ID_UNIQUE_CHECK]    Script Date: 2025-05-04 오전 2:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[SP_ID_UNIQUE_CHECK]
    @ID VARCHAR(50)
AS
BEGIN

	SET LOCK_TIMEOUT 20000;

	/*ID 중복 검사*/
    DECLARE @ErrorCode INT;
	SET @ErrorCode = 0;
    SET @ErrorCode = (SELECT COUNT(*) FROM TBL_ACCOUNT WHERE ID = @ID);
	IF @ErrorCode > 0
	BEGIN
		SET @ErrorCode = -1;
	END
    RETURN @ErrorCode;
END
