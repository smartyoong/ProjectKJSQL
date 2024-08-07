USE [AccountDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_CREATE_NICKNAME]    Script Date: 2024-07-14 오전 3:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_CREATE_NICKNAME]
	@ID VARCHAR(50),
	@NickName NVARCHAR(16)
AS
BEGIN
	DECLARE @Count INT = 0;
	
	SET @Count = (SELECT COUNT(*) FROM TBL_ACCOUNT WHERE ID = @ID);

	IF(@Count != 1)
		RETURN -1;
	ELSE
	BEGIN
		BEGIN TRY
			UPDATE TBL_ACCOUNT SET NICKNAME = @NickName WHERE ID = @ID;
		END TRY
		BEGIN CATCH
			PRINT 'CREATE_NICKNAME : ' + ERROR_MESSAGE();
			RETURN -2
		END CATCH
	END

	RETURN 0
END