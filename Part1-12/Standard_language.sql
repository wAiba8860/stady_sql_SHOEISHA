--標準語を話そう
--結合には標準の構文を使う
--かつては検索条件と区別せずにWHERE句に一緒にかいていた
SELECT
    *
FROM
    Foo F,
    Bar B
WHERE
    F.state = B.state
    AND F.city = '東京';

--標準
--内部結合で、結合条件が「F.state = B.state」であることが一目でわかる
SELECT
    *
FROM
    Foo F
    INNER JOIN bar B ON F.state = B.state
WHERE
    F.city = '東京';

--ウィンドウ関数を用いて相関サブクエリを追放する
--FROM句から書く