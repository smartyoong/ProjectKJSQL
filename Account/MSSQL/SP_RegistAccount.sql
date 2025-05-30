USE [AccountDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGIST_ACCOUNT]    Script Date: 2025-05-04 오전 2:05:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[SP_REGIST_ACCOUNT]
    @ID VARCHAR(50),
    @PW VARCHAR(50),
	@IP VARCHAR(50)
AS
BEGIN

	SET LOCK_TIMEOUT 20000;

	/*ID 중복 검사*/
    DECLARE @ErrorCode INT;
    SET @ErrorCode = (SELECT COUNT(*) FROM TBL_ACCOUNT WHERE ID = @ID);
	IF @ErrorCode > 0
	BEGIN
		RETURN -1;
	END

	/*비밀 번호 규칙 검사는 클라이언트에서 진행한다. 테이블에 삽입*/

	BEGIN TRY
        INSERT INTO TBL_ACCOUNT (ID, PW, IP) VALUES (@ID, PWDENCRYPT(@PW), @IP);
    END TRY
    BEGIN CATCH
        PRINT 'REGIST_ACCOUNT: ' + ERROR_MESSAGE();
		RETURN -2
    END CATCH


    RETURN 0;
END