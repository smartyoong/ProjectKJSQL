USE [GameDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_CREATE_CHARACTER]    Script Date: 2025-05-04 오전 1:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[SP_CREATE_CHARACTER]
	@ID VARCHAR(50),
	@GENDER INT,
	@JOB INT,
	@PREST_ID INT
AS
BEGIN
	DECLARE @USER_CODE_TABLE TABLE(USER_CODE INT);
	DECLARE @USER_CODE INT;

	SET LOCK_TIMEOUT 20000;
	SET XACT_ABORT ON;

	BEGIN TRAN
	BEGIN TRY

		INSERT INTO TBL_USER_CODE_NUMBER
		OUTPUT inserted.CODE_NUMBER INTO @USER_CODE_TABLE
		VALUES(@ID);

		SELECT @USER_CODE = USER_CODE FROM @USER_CODE_TABLE;

		INSERT INTO TBL_CHARACTER_PRESET VALUES(@USER_CODE,@GENDER,@PREST_ID);


		INSERT INTO TBL_CHAR_JOB_INFO VALUES(@USER_CODE,@JOB,1);
		

		INSERT INTO TBL_CHAR_LAST_MAP_INFO(ID,MAP_ID,X,Y) VALUES(@USER_CODE,0,300,300);
		

		INSERT INTO TBL_CHAR_LEVEL_INFO VALUES(@USER_CODE,1,0);

		INSERT INTO TBL_HEALTH VALUES(@USER_CODE,100,50);

		INSERT INTO TBL_GM VALUES(@USER_CODE,0);

		COMMIT TRAN

		SET XACT_ABORT OFF;
		RETURN 0;

	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'CREATE_CHARACTER : ' + ERROR_MESSAGE()
		RETURN -1;
	END CATCH
END