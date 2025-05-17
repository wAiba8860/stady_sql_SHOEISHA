SELECT
    server,
    sample_date,
    sum(load_val) OVER () AS sum_load
FROM
    ServerLoadSample;

-- カラムはserver sample_date sum_load
-- 行数は集約されずにsum_loadには全てのload_valの値を合計した値が
-- 均一に入る？
SELECT
    server,
    sample_date,
    sum(load_val) OVER (
        PARTITION BY
            server
    ) AS sum_load
FROM
    ServerLoadSample;

-- カラムはserver sample_date sum_load
-- PARTITION byによってserverごとのパーティションが作成されるため
-- server Aのsum_loadにはそれぞれserverAのload_valの合計値が入る
-- BにはserverBのload_valの合計値がそれぞれのsum_loadにはいる？