CREATE PROCEDURE SP_UPDATE_JOB
	@ID VARCHAR(50),
	@JOB INT
AS
BEGIN
	UPDATE TBL_CHAR_JOB_INFO SET JOB = @JOB WHERE ID = @ID;
	RETURN 0;
END