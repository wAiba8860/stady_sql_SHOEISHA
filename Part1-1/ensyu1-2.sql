SELECT
    CASE sex
        WHEN '1' THEN '男'
        ELSE '女'
    END AS "性別",
    sum(population) AS "全国",
    sum(
        CASE
            WHEN pref_name = '徳島' THEN population
            ELSE 0
        END
    ) AS "徳島",
    sum(
        CASE
            WHEN pref_name = '香川' THEN population
            ELSE 0
        END
    ) AS "香川",
    sum(
        CASE
            WHEN pref_name = '愛媛' THEN population
            ELSE 0
        END
    ) AS "愛媛",
    sum(
        CASE
            WHEN pref_name = '高知' THEN population
            ELSE 0
        END
    ) AS "高知",
    sum(
        CASE
            WHEN pref_name IN ('徳島', '香川', '愛媛', '高知') THEN population
            ELSE 0
        END
    ) AS "四国（再掲）"
FROM
    PopTbl2
GROUP BY
    CASE sex
        WHEN '1' THEN '男'
        ELSE '女'
    END;