-- SELECT
--     *
-- FROM
--     ArrayTbl
-- WHERE
--     1 = ALL (
--         col1,
--         col2,
--         col3,
--         col4,
--         col5,
--         col6,
--         col7,
--         col8,
--         col9,
--         col10
--     );
SELECT
    *
FROM
    ArrayTbl
WHERE
    9 IN (
        col1,
        col2,
        col3,
        col4,
        col5,
        col6,
        col7,
        col8,
        col9,
        col10
    );

SELECT
    *
FROM
    ArrayTbl
WHERE
    coalesce(
        col1,
        col2,
        col3,
        col4,
        col5,
        col6,
        col7,
        col8,
        col9,
        col10
    ) IS NULL;