'create table Teams (member VARCHAR(32) PRIMARY KEY,team char(8),age INTEGER);

insert into Teams values(' 大木 ',' A ',28);
insert into Teams values(' 逸見 ',' A ',19);
insert into Teams values(' 新藤 ',' A ',23);
insert into Teams values(' 山田 ',' B ',40);
insert into Teams values(' 久本 ',' B ',29);
insert into Teams values(' 橋田 ',' C ',30);
insert into Teams values(' 野々宮 ',' D ',28);
insert into Teams values(' 鬼塚 ',' D ',28);
insert into Teams values(' 加藤 ',' D ',24);
insert into Teams values(' 新城 ',' D ',22);'
SELECT
    MEMBER,
    team,
    age,
    RANK() OVER (
        PARTITION BY
            team
        ORDER BY
            age DESC
    ) rn,
    DENSE_RANK() OVER (
        PARTITION BY
            team
        ORDER BY
            age DESC
    ) dense_rn,
    ROW_NUMBER() OVER (
        PARTITION BY
            team
        ORDER BY
            age DESC
    ) row_num
FROM
    Teams
ORDER BY
    team,
    rn;

'CREATE TABLE Naturals (num INTEGER);
INSERT INTO Naturals VALUES (0);
INSERT INTO Naturals VALUES (1);
INSERT INTO Naturals VALUES (2);
INSERT INTO Naturals VALUES (3);
INSERT INTO Naturals VALUES (4);
INSERT INTO Naturals VALUES (5);
INSERT INTO Naturals VALUES (6);
INSERT INTO Naturals VALUES (7);
INSERT INTO Naturals VALUES (8);
INSERT INTO Naturals VALUES (9);
INSERT INTO Naturals VALUES (10);'
--1から10までを、3の法と剰余類に分類
SELECT
    MOD(num, 3) AS modulo,
    num
FROM
    Naturals
ORDER BY
    modulo,
    num;

--もとのテーブルから（ほぼ）5分の1の行数で抽出する
SELECT
    *
FROM
    Naturals
WHERE
    MOD(num, 5) = 0;

--テーブルに連番がない場合でも、ROW_NUMBER関数を使えばok
SELECT
    *
FROM
    (
        SELECT
            num,
            ROW_NUMBER() OVER (
                ORDER BY
                    num
            ) AS seq
        FROM
            Naturals
    )
WHERE
    MOD(num, 5) = 0;