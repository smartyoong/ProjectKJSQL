CREATE PROCEDURE SP_UPDATE_JOB_LEVEL
	@ID VARCHAR(50),
	@JOB_LEVEL INT
AS
BEGIN
	UPDATE TBL_CHAR_JOB_INFO SET JOB_LEVEL = @JOB_LEVEL WHERE ID = @ID;
	RETURN 0;
END