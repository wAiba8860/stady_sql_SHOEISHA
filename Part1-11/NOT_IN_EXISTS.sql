--遅い
--63ms
SELECT
    *
FROM
    Class_A
WHERE
    id IN (
        SELECT
            id
        FROM
            Class_B
    );

--早い
--60ms
SELECT
    *
FROM
    Class_A A
WHERE
    EXISTS (
        SELECT
            id
        FROM
            Class_B B
        WHERE
            A.id = B.id
    );

--フラット化
SELECT
    A.id,
    A.name
FROM
    Class_A A
    INNER JOIN Class_B B ON A.id = B.id;