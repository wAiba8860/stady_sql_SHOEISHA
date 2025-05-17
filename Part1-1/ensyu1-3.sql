SELECT
    KE,
    CASE KE
        WHEN 'B' THEN 1
        WHEN 'A' THEN 2
        WHEN 'D' THEN 3
        WHEN 'C' THEN 4
        ELSE NULL
    END AS "ソート順"
FROM
    Greatests
ORDER BY
    CASE KE
        WHEN 'B' THEN 1
        WHEN 'A' THEN 2
        WHEN 'D' THEN 3
        WHEN 'C' THEN 4
        ELSE NULL
    END;