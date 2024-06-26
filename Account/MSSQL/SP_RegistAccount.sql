USE [AccountDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_REGIST_ACCOUNT]    Script Date: 2024-06-17 오후 9:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_REGIST_ACCOUNT]
    @ID VARCHAR(50),
    @PW VARCHAR(50),
	@IP VARCHAR(50)
AS
BEGIN
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