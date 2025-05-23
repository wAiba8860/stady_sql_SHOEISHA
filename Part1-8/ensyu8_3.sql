SELECT
    id,
    MAX(
        CASE
            WHEN B_name IS NOT NULL THEN B_name
            ELSE A_name
        END
    ) AS new_name
FROM
    (
        SELECT
            A.id AS id,
            A.name AS A_name,
            B.name AS B_name
        FROM
            Class_A A
            LEFT OUTER JOIN Class_B B ON A.id = B.id
        UNION
        SELECT
            B.id AS id,
            A.name,
            B.name
        FROM
            Class_A A
            RIGHT OUTER JOIN Class_B B ON A.id = B.id
    ) TMP
GROUP BY
    id;

MERGE INTO Class_A A USING (
    SELECT
        *
    FROM
        Class_B
) B ON (A.id = B.id) WHEN matched THEN
UPDATE
SET
    A.name = B.name WHEN NOT matched THEN INSERT (id, name)
VALUES
    (B.id, B.name);