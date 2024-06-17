USE [AccountDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_LOGIN]    Script Date: 2024-06-17 오후 8:18:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_LOGIN]
    @ID VARCHAR(50),
    @PW VARCHAR(50),
	@NickName NVARCHAR(16) OUTPUT
AS
BEGIN
    DECLARE @result INT = 0;
	Set @NickName = 'NO ACCOUNT';

    IF EXISTS (SELECT * FROM TBL_ACCOUNT WHERE ID = @ID)
        SET @result = 1;
	IF(SELECT PWDCOMPARE(@PW,PW) FROM TBL_ACCOUNT WHERE ID = @ID) = 1
	BEGIN
		SET @result = 2;
	END

	SET @NickName = ISNULL((SELECT TBL_ACCOUNT.NICKNAME FROM TBL_ACCOUNT WHERE ID = @ID), 'NO ACCOUNT');

	/*result 0 : no account , 1 : Password Wrong, 2 : Success*/
    RETURN @result;
END