-- SELECT
--     coalesce(A.id, B.id) AS id,
--     A.name AS A_name,
--     B.name AS B_name
-- FROM
--     Class_A A
--     FULL OUTER JOIN Class_B B ON A.id = B.id;
SELECT
    A.id AS id,
    A.name,
    B.name
FROM
    Class_A A
    LEFT JOIN Class_B B ON A.id = B.id
UNION
SELECT
    B.id AS id,
    A.name,
    B.name
FROM
    Class_A A
    RIGHT JOIN Class_B B ON A.id = B.id;

SELECT
    A.id AS id,
    A.name AS A_name
FROM
    Class_A A
    LEFT JOIN Class_B B ON A.id = B.id
WHERE
    B.name IS NULL;

SELECT
    B.id AS id,
    B.name AS B_name
FROM
    Class_A A
    RIGHT JOIN Class_B B ON A.id = B.id
WHERE
    A.name IS NULL;

-- SELECT
--     coalesce(A.id, B.id) AS id,
--     coalesce(A.name, B.name) AS name
-- FROM
--     Class_A A
--     FULL OUTER JOIN Class_B B ON A.id = B.id
-- WHERE
--     A.name IS NULL
--     OR B.name IS NULL;
SELECT
    A.id AS id,
    coalesce(A.name, B.name)
FROM
    Class_A A
    LEFT JOIN Class_B B ON A.id = B.id
WHERE
    B.name IS NULL
UNION
SELECT
    B.id AS id,
    coalesce(A.name, B.name)
FROM
    Class_A A
    RIGHT JOIN Class_B B ON A.id = B.id
WHERE
    A.name IS NULL;

SELECT DISTINCT
    shop
FROM
    ShopItems SI1
WHERE
    NOT EXISTS (
        SELECT
            I.item
        FROM
            Items I
            LEFT OUTER JOIN ShopItems SI2 ON I.item = SI2.item
            AND SI1.shop = SI2.shop
        WHERE
            SI2.item IS NULL
    );

SELECT
    *
FROM
    Items I
    LEFT OUTER JOIN ShopItems SI1 ON I.item = SI1.item;
