SELECT
    MASTER.age_class AS age_class,
    MASTER.sex_cd AS sex_cd,
    DATA.pop_tohoku AS pop_tohoku,
    DATA.pop_kanto AS pop_kanto
FROM
    (
        SELECT
            age_class,
            sex_cd
        FROM
            TblAge
            CROSS JOIN TblSex
    ) MASTER
    LEFT OUTER JOIN (
        SELECT
            age_class,
            sex_cd,
            sum(
                CASE
                    WHEN pref_name IN ('青森', '秋田') THEN population
                    ELSE NULL
                END
            ) AS pop_tohoku,
            sum(
                CASE
                    WHEN pref_name IN ('東京', '千葉') THEN population
                    ELSE NULL
                END
            ) AS pop_kanto
        FROM
            TblPop
        GROUP BY
            age_class,
            sex_cd
    ) DATA ON MASTER.age_class = DATA.age_class
    AND MASTER.sex_cd = DATA.sex_cd;

SELECT
    MASTER.age_class AS age_class,
    MASTER.sex_cd AS sex_cd,
    sum(
        CASE
            WHEN pref_name IN ('秋田', '青森') THEN population
            ELSE NULL
        END
    ) AS pop_tohoku,
    sum(
        CASE
            WHEN pref_name IN ('東京', '千葉') THEN population
            ELSE NULL
        END
    ) AS pop_kanto
FROM
    (
        SELECT
            age_class,
            sex_cd
        FROM
            TblAge
            CROSS JOIN TblSex
    ) MASTER
    LEFT OUTER JOIN TblPop TP ON MASTER.age_class = TP.age_class
    AND MASTER.sex_cd = TP.sex_cd
GROUP BY
    age_class,
    sex_cd;

SELECT
    *
FROM
    (
        SELECT
            age_class,
            sex_cd
        FROM
            TblAge
            CROSS JOIN TblSex
    ) MASTER
    LEFT OUTER JOIN TblPop TP ON MASTER.age_class = TP.age_class
    AND MASTER.sex_cd = TP.sex_cd