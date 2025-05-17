SELECT
    shohin_id,
    shohin_mei,
    hanbai_tanka,
    avg(hanbai_tanka) OVER (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    ) AS moving_avg
FROM
    shohin;

SELECT
    shohin_id,
    shohin_mei,
    hanbai_tanka,
    avg(hanbai_tanka) OVER W AS moving_avg
FROM
    shohin
WINDOW
    W AS (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    );

SELECT
    shohin_id,
    shohin_mei,
    hanbai_tanka,
    avg(hanbai_tanka) OVER W AS moving_avg,
    sum(hanbai_tanka) OVER W AS moving_sum,
    count(hanbai_tanka) OVER W AS moving_count,
    max(hanbai_tanka) OVER W AS moving_max
FROM
    shohin
WINDOW
    W AS (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    );

SELECT
    shohin_id,
    shohin_mei,
    hanbai_tanka,
    avg(hanbai_tanka) OVER (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    ) AS moving_avg,
    sum(hanbai_tanka) OVER (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    ) AS moving_sum,
    count(hanbai_tanka) OVER (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    ) AS moving_count,
    max(hanbai_tanka) OVER (
        ORDER BY
            shohin_id ROWS BETWEEN 2 preceding
            AND CURRENT ROW
    ) AS moving_max
FROM
    shohin;
