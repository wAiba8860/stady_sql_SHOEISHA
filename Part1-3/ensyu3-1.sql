SELECT
    P1.name AS name_1,
    P2.name AS name_2
FROM
    Products P1
    INNER JOIN Products P2 ON P1.name >= P2.name;

-- DELETE FROM Products P1
-- CREATE TABLE Products_NoRedundant AS
-- SELECT
--     row_NUMBER() OVER (
--         PARTITION BY
--             name,
--             price
--         ORDER BY
--             name
--     ) AS row_num,
--     name,
--     price
-- FROM
--     Products;
--delete from Products_NoRedundant
--where row_num > 1;