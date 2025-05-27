--except
SELECT
    seq
FROM
    Sequence
WHERE
    seq BETWEEN 1 AND 12
EXCEPT
SELECT
    seq
FROM
    SeqTbl;

--NOT IN
SELECT
    seq
FROM
    Sequence
WHERE
    seq BETWEEN 1 AND 12
    AND seq NOT IN (
        SELECT
            seq
        FROM
            SeqTbl
    );

--ここから
--NOT EXISTS
SELECT
    S1.seq
FROM
    Sequence S1
WHERE
    S1.seq BETWEEN 1 AND 12
    AND NOT EXISTS (
        SELECT
            S2.seq
        FROM
            SeqTbl S2
        WHERE
            S2.seq = S1.seq
    );

--外部結合
SELECT
    S1.seq
FROM
    Sequence S1
    LEFT OUTER JOIN SeqTbl S2 ON S1.seq = S2.seq
WHERE
    S1.seq BETWEEN 1 AND 12
    AND S2.seq IS NULL;