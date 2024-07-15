USE [GameDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_READ_CHARACTER]    Script Date: 2024-07-15 오후 8:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_READ_CHARACTER]
	@ID VARCHAR(50)
AS
BEGIN
	DECLARE @COUNT INT = 0;

	SELECT @COUNT = COUNT(*) FROM TBL_CHARACTER_PRESET WHERE ID = @ID;

	IF @COUNT <= 0
		RETURN -1;
	

    SELECT 
        C.ID,
        C.GENDER,
		C.PRESET_NUMBER,
        J.JOB,
        J.JOB_LEVEL,
        L.MAP_ID,
        L.X,
        L.Y,
        LV.CURRENT_LEVEL,
        LV.CURRENT_EXP
    FROM TBL_CHARACTER_PRESET C
    INNER JOIN TBL_CHAR_JOB_INFO J ON C.ID = J.ID
    INNER JOIN TBL_CHAR_LAST_MAP_INFO L ON C.ID = L.ID
    INNER JOIN TBL_CHAR_LEVEL_INFO LV ON C.ID = LV.ID
    WHERE C.ID = @ID

	RETURN 0;
END;