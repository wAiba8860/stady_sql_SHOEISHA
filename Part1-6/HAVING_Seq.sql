SELECT
    '歯抜けあり' AS gap
FROM
    SeqTbl
HAVING
    count(*) <> max(seq);

SELECT
    min(seq + 1) AS gap
FROM
    SeqTbl
WHERE
    (seq + 1) NOT IN (
        SELECT
            seq
        FROM
            SeqTbl
    );

SELECT
    '歯抜けあり' AS gap
FROM
    SeqTbl
HAVING
    count(*) <> max(seq) - min(seq) + 1;

SELECT
    CASE
        WHEN count(*) = 0 THEN 'テーブルが空です'
        WHEN count(*) <> max(seq) - min(seq) + 1 THEN '歯抜けあり'
        ELSE '連続'
    END AS gap
FROM
    SeqTbl;

SELECT
    CASE
        WHEN count(*) = 0
        OR min(seq) > 1 THEN 1
        ELSE (
            SELECT
                min(seq + 1)
            FROM
                SeqTbl S1
            WHERE
                NOT EXISTS (
                    SELECT
                        *
                    FROM
                        SeqTbl S2
                    WHERE
                        S2.seq = S1.seq + 1
                )
        )
    END AS gap
FROM
    SeqTbl;