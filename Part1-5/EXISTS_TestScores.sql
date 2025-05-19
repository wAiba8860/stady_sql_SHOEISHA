SELECT DISTINCT
    student_id
FROM
    TestScores TS1
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            TestScores TS2
        WHERE
            TS1.student_id = TS2.student_id
            AND TS2.score < 50
    );

SELECT DISTINCT
    student_id
FROM
    TestScores TS1
WHERE
    subject IN ('算数', '国語')
    AND NOT EXISTS (
        SELECT
            *
        FROM
            TestScores TS2
        WHERE
            TS1.student_id = TS2.student_id
            AND 1 = CASE
                WHEN subject = '算数'
                AND score < 80 THEN 1
                WHEN subject = '国語'
                AND score < 50 THEN 1
                ELSE 0
            END
    );

SELECT
    student_id
FROM
    TestScores TS1
WHERE
    subject IN ('算数', '国語')
    AND NOT EXISTS (
        SELECT
            *
        FROM
            TestScores TS2
        WHERE
            TS1.student_id = TS2.student_id
            AND 1 = CASE
                WHEN subject = '算数'
                AND score < 80 THEN 1
                WHEN subject = '国語'
                AND score < 50 THEN 1
                ELSE 0
            END
    )
GROUP BY
    student_id
HAVING
    count(*) = 2;