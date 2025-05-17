SELECT DISTINCT
    P1.name,
    P1.price
FROM
    products P1
    INNER JOIN products P2 ON P1.name <> P2.name
    AND P1.price = P2.price
ORDER BY
    P1.price;

SELECT
    name,
    price,
    rank() OVER (
        ORDER BY
            price DESC
    ) AS rank_1,
    dense_rank() OVER (
        ORDER BY
            price DESC
    ) AS rank_2
FROM
    products;

SELECT
    P1.name,
    max(P1.price) AS price,
    count(P2.name) + 1 AS rank_1
FROM
    Products P1
    LEFT OUTER JOIN Products P2 ON P1.price < P2.price
GROUP BY
    P1.name
ORDER BY
    rank_1;

SELECT
    P1.name,
    P2.name
FROM
    Products P1
    LEFT OUTER JOIN Products P2 ON P1.price < P2.price;