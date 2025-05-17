SELECT
    P1.name AS name_1,
    P2.name AS name_2
FROM
    Products P1
    CROSS JOIN Products P2;

SELECT
    P1.name AS name_1,
    P2.name AS name_2
FROM
    Products P1
    INNER JOIN Products P2 ON P1.name <> P2.name;

SELECT
    P1.name AS name_1,
    P2.name AS name_2
FROM
    Products P1,
    Products P2
WHERE
    P1.name <> P2.name;

SELECT
    P1.name AS name_1,
    P2.name AS name_2
FROM
    Products P1
    INNER JOIN Products P2 ON P1.name > P2.name;

SELECT
    P1.name AS name_1,
    P2.name AS name_2,
    P3.name AS name_3
FROM
    Products P1
    INNER JOIN Products P2 ON P1.name > P2.name
    INNER JOIN Products P3 ON P2.name > P3.name;