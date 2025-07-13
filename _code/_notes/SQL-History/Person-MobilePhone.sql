DECLARE @PersonId int = 33430;

SELECT TOP 10
    *
FROM
    [History] his
WHERE
    his.[ValueName] = 'Mobile Phone'
    AND
    his.[EntityTypeId] = 15
    AND 
    his.[EntityId] = @PersonId
ORDER BY
    his.[CreatedDateTime] DESC
;