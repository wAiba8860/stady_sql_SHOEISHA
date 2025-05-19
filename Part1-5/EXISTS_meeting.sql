SELECT DISTINCT
    M1.meeting,
    M2.person
FROM
    meetings M1
    CROSS JOIN meetings M2
WHERE
    NOT EXISTS (
        SELECT
            'ここはなんでもいいんだよ'
        FROM
            meetings M3
        WHERE
            M1.meeting = M3.meeting
            AND M2.person = M3.person
    );

SELECT
    M1.meeting,
    M2.person
FROM
    meetings M1,
    meetings M2
EXCEPT
SELECT
    meeting,
    person
FROM
    meetings;

SELECT DISTINCT
    M1.meeting,
    M1.person,
    M2.meeting,
    M2.person
FROM
    meetings M1
    CROSS JOIN meetings M2;

SELECT DISTINCT
    M1.meeting,
    M2.person
FROM
    meetings M1
    CROSS JOIN meetings M2
    LEFT JOIN meetings M3 ON M1.meeting = M3.meeting
    AND M2.person = M3.person
WHERE
    M3.meeting IS NULL;
