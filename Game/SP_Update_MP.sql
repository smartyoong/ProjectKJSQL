CREATE PROCEDURE SP_UPDATE_MP
	@ID VARCHAR(50),
	@MP INT
AS
BEGIN
	UPDATE TBL_HEALTH SET MP = @MP WHERE ID = @ID
	RETURN 0;
END