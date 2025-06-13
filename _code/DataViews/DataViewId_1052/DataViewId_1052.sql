/**************************************************************************************************************
    
    This SQL is found in DataViewId:1052
    Currently, this DataView is named: LifeGroup - Active, tagged as "LifeGroup"
    
    Note:
    - It's possible that the SQL results will not be an exact match with the results in the DataView.
    - That's because the DataView has extra logic that SparkDev hardcoded (such as filtering out inactive Person records).
    
    Path:
    _code/DataViews/DataViewId_907/DataViewId_1052.sql
    
**************************************************************************************************************/

SELECT
    g.[Id]
FROM
    [Group] g
    INNER JOIN [TaggedItem] ti ON ti.[EntityGuid] = g.[Guid] AND ti.[TagId] = 20 --This is the "LifeGroup" Tag
WHERE
    g.[GroupTypeId] IN (25, 45, 46) --These are "LifeGroup", "MensGroup" and "WomensGroup", respectively
    AND
    g.[IsActive] = 1 AND g.[IsArchived] = 0 --These are the default criteria for a Group being "Active"
;