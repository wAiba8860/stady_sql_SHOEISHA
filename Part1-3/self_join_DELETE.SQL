-- DELETE FROM Products P1
-- WHERE
--     rowid < (
--         SELECT
--             MAX(P2.rowid)
--         FROM
--             Products P2
--         WHERE
--             P1.name = P2.name
--             AND P1.price = P2.price
--     );
DELETE FROM Products P1
WHERE
    EXISTS (
        SELECT
            *
        FROM
            Products P2
        WHERE
            P1.name = P2.name
            AND P1.price = P2.price
    );