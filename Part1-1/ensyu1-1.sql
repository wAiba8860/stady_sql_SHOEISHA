SELECT
    KE,
    CASE
        WHEN x > y THEN x
        ELSE y
    END AS greatest
FROM
    Greatests;

SELECT
    KE,
    CASE
        WHEN x < y THEN CASE
            WHEN y < z THEN z
            ELSE y
        END
        ELSE CASE
            WHEN x < z THEN z
            ELSE x
        END
    END AS greatest
FROM
    Greatests;
