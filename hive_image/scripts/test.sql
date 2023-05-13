beeline -u jdbc:hive2://localhost:10000 -n user -p userpass
beeline -u jdbc:hive2://localhost:10000 -n root

CREATE DATABASE user_db;

CREATE TABLE user_db.students (name VARCHAR(64), age INT);

INSERT INTO TABLE user_db.students VALUES ('fred flintstone', 35), ('barney rubble', 32);

INSERT INTO TABLE students VALUES ('fred flintstone', 35, 1.28), ('barney rubble', 32, 2.32);

CREATE DATABASE user_db1;

CREATE TABLE user_db1.user_tbl1 (a INT);

INSERT INTO TABLE user_db1.user_tbl1 VALUES (1), (2);

CREATE DATABASE db1;

CREATE TABLE db1.user_tbl1 (a INT);

INSERT INTO TABLE db1.user_tbl1 VALUES (1), (2);



CREATE TABLE IF NOT EXISTS t (a Int);
INSERT INTO TABLE t select 



-- dummy table作成し、１レコード追加
create table dual (dummy string);
insert into table dual select count(*) from dual;

-- sample table作成し、データ登録が実施できるか確認してみる
create table sample (key string);
insert into sample select key from sample;


INSERT INTO TABLE dual select ARRAY("a", "b");

INSERT INTO TABLE example_table
    > SELECT "Hello, World"
    > FROM (SELECT "dummy") dummy;



create table csv_table(
  id int,
  name string
)
row format delimited
fields terminated by ','
lines terminated by '\n';


LOAD DATA INPATH '/user/hive/test.csv' INTO TABLE csv_table;
