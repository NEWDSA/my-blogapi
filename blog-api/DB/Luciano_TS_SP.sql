-- Create a new stored procedure called 'StoredProcedureName' in schema 'SchemaName'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'SchemaName'
    AND SPECIFIC_NAME = N'StoredProcedureName'
)
DROP PROCEDURE SchemaName.StoredProcedureName
GO
-- Create the stored procedure in the specified schema
ALTER PROCEDURE Luciano_TS
    --@param1 /*parameter name*/ int /*datatype_for_param1*/ = 0, /*default_value_for_param1*/
    --@param2 /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param2*/
    @content nvarchar(100)
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    --SELECT @param1, @param2
    -- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
      DECLARE @result NVARCHAR(100)
   SELECT @result=title
FROM [Luciano_DB].[dbo].[Luciano_Note]
WHERE title LIKE '%'+@content+'%' 
PRINT @result
--    IF(@result!='')
--    BEGIN
--     SELECT *
--     FROM Luciano_Note;
-- END
    GO
GO
-- example to execute the stored procedure we just created
--EXECUTE Luciano_TS  '2019' /*value_for_param1*/, 2 /*value_for_param2*/
GO

--- test example

