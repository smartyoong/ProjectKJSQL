USE [GameDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_MP]    Script Date: 2025-01-19 오후 7:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_UPDATE_MP]
	@ID VARCHAR(50),
	@MP INT
AS
BEGIN
	DECLARE @USER_CODE INT = 0;
	SELECT @USER_CODE = CODE_NUMBER FROM TBL_USER_CODE_NUMBER WHERE ID = @ID;
	UPDATE TBL_HEALTH SET MP = @MP WHERE ID = @USER_CODE
	RETURN 0;
END