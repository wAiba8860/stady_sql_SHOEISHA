SELECT
    shohin_bunrui,
    shohin_mei,
    hanbai_tanka
FROM
    Shohin S1
WHERE
    hanbai_tanka > (
        SELECT
            AVG(hanbai_tanka)
        FROM
            Shohin S2
        WHERE
            S1.shohin_bunrui = S2.shohin_bunrui
        GROUP BY
            shohin_bunrui
    );

SELECT
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka
FROM
    (
        SELECT
            shohin_mei,
            shohin_bunrui,
            hanbai_tanka,
            avg(hanbai_tanka) OVER (
                PARTITION BY
                    shohin_bunrui
            ) AS avg_tanka
        FROM
            Shohin
    ) TMP
WHERE
    hanbai_tanka > avg_tanka;

SELECT
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    avg(hanbai_tanka) OVER (
        PARTITION BY
            shohin_bunrui
    ) AS avg_tanka
FROM
    Shohin;