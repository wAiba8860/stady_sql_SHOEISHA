--9-1
--union結合からintersectを引いた集合のカラムが0なのかどうかを事前にクエリで書いてから
--両者が等しいか求める
SELECT
    CASE
        WHEN count(*) = (
            SELECT
                count(*)
            FROM
                tbl_A
        )
        AND count(*) = (
            SELECT
                count(*)
            FROM
                tbl_B
        ) THEN '等しい'
        ELSE '異なる'
    END AS RESULT
FROM
    (
        SELECT
            *
        FROM
            tbl_A
        UNION
        SELECT
            *
        FROM
            tbl_B
    ) TMP;

--9-2
SELECT DISTINCT
    emp
FROM
    EmpSkills ES1
WHERE
    (
        SELECT
            count(skill)
        FROM
            Skills
    ) = (
        SELECT
            count(skill)
        FROM
            EmpSkills ES2
        WHERE
            ES1.emp = ES2.emp
    )
    AND NOT EXISTS (
        SELECT
            skill
        FROM
            Skills
        EXCEPT
        SELECT
            skill
        FROM
            EmpSkills ES3
        WHERE
            ES1.emp = ES3.emp
    );

--回答
SELECT
    emp
FROM
    EmpSkills ES1
WHERE
    NOT EXISTS (
        SELECT
            skill
        FROM
            Skills
        EXCEPT
        SELECT
            skill
        FROM
            EmpSkills ES3
        WHERE
            ES1.emp = ES3.emp
    )
GROUP BY
    emp
HAVING
    count(*) = (
        SELECT
            count(*)
        FROM
            skills
    );

SELECT DISTINCT
    emp
FROM
    EmpSkills ES1
WHERE
    NOT EXISTS (
        SELECT
            skill
        FROM
            Skills
        EXCEPT
        SELECT
            skill
        FROM
            EmpSkills ES2
        WHERE
            ES1.emp = ES2.emp
    )
    AND NOT EXISTS (
        SELECT
            skill
        FROM
            EmpSkills ES3
        WHERE
            ES1.emp = ES3.emp
        EXCEPT
        SELECT
            skill
        FROM
            Skills
    );