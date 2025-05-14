--単純CASE式
CASE sex
    WHEN '1' THEN '男'
    WHEN '2' THEN '女'
    ELSE 'その他'
END
--検索CASE式
CASE
    WHEN sex = '1' THEN '男'
    WHEN sex = '2' THEN '女'
    ELSE 'その他'
END