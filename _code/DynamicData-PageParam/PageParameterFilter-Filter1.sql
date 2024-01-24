SELECT attv.[Value] AS 'Value', CONCAT(p.NickName, ' ', p.LastName) AS 'Text' FROM [AttributeValue] attv INNER JOIN [Group] g ON g.Id=attv.EntityId INNER JOIN [Person] p ON p.Id=attv.ValueAsPersonId WHERE attv.AttributeId IN (8975, 8978, 8982, 8979) ORDER BY p.NickName;

SELECT
    attv.[Value] AS 'Value'
    , CONCAT(p.NickName, ' ', p.LastName) AS 'Text' 
FROM
    [AttributeValue] attv
    INNER JOIN [Group] g ON g.Id=attv.EntityId
    INNER JOIN [Person] p ON p.Id=attv.ValueAsPersonId
WHERE
    attv.AttributeId IN (8975, 8978, 8982, 8979)
ORDER BY
    p.NickName
;