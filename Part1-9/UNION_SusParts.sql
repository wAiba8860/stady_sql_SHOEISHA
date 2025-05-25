--組み合わせを作るだけならGROUP BY句を削除してDISTINCTでも可
SELECT
    SP1.sup AS s1,
    SP2.sup AS s2
FROM
    SupParts SP1,
    SupParts SP2
WHERE
    SP1.sup < SP2.sup
GROUP BY
    SP1.sup,
    SP2.sup;

SELECT
    SP1.sup AS s1,
    SP2.sup AS s2
FROM
    SupParts SP1,
    SupParts SP2
WHERE
    SP1.sup < SP2.sup
    AND SP1.part = SP2.part
GROUP BY
    SP1.sup,
    SP2.sup
HAVING
    count(*) = (
        SELECT
            count(*)
        FROM
            SupParts SP3
        WHERE
            SP3.sup = SP1.sup
    )
    AND count(*) = (
        SELECT
            count(*)
        FROM
            SupParts SP4
        WHERE
            SP4.sup = SP2.sup
    );

-- SELECT
--     'A contains B'
-- FROM
--     SupParts
-- WHERE
--     (
--         SELECT
--             part
--         FROM
--             SupParts
--         WHERE
--             sup = 'A'
--     ) CONTAINS (
--         SELECT
--             part
--         FROM
--             SupParts
--         WHERE
--             sup = 'B'
--     );