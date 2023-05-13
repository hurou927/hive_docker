# Hive on Docker

## Start
```
$ cargo make run
```
## Sample

1. Run beeline
```sh
$ cargo make bee
```

2. Create Table
```sql
create table csv_table(
  id int,
  name string
)
row format delimited
fields terminated by ','
lines terminated by '\n';
```

3. Load data
```sql
LOAD DATA INPATH '/root/test_data/test.csv' INTO TABLE csv_table;
```

4, Show data
```sql
SELECT * FROM csv_table;
```
