SELECT
    D1.digit + (D2.digit * 10) AS seq
FROM
    Digits D1
    CROSS JOIN Digits D2
ORDER BY
    seq;

SELECT
    D1.digit + (D2.digit * 10) + (D3.digit * 100) AS seq
FROM
    Digits D1
    CROSS JOIN Digits D2
    CROSS JOIN Digits D3
WHERE
    D1.digit + (D2.digit * 10) + (D3.digit * 100) BETWEEN 1 AND 542
ORDER BY
    seq;

--シーケンスビューを作成0~999
CREATE VIEW Sequence (seq) AS
SELECT
    D1.digit + (D2.digit * 10) + (D3.digit * 100)
FROM
    Digits D1
    CROSS JOIN Digits D2
    CROSS JOIN Digits D3;

--シーケンスビューから1~100までを取得
SELECT
    seq
FROM
    Sequence
WHERE
    seq BETWEEN 1 AND 100
ORDER BY
    seq;

--欠番を全部求める
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

SELECT
    seq
FROM
    Sequence
WHERE
    seq BETWEEN (
        SELECT
            min(seq)
        FROM
            SeqTbl
    ) AND (
        SELECT
            max(seq)
        FROM
            SeqTbl
    )
EXCEPT
SELECT
    seq
FROM
    SeqTbl;