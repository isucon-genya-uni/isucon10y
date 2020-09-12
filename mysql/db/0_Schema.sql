DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id             INTEGER          NOT NULL PRIMARY KEY,
    name           VARCHAR(64)      NOT NULL,
    description    VARCHAR(4096)    NOT NULL,
    thumbnail      VARCHAR(128)     NOT NULL,
    address        VARCHAR(128)     NOT NULL,
    latitude       DOUBLE PRECISION NOT NULL,
    longitude      DOUBLE PRECISION NOT NULL,
    rent           INTEGER          NOT NULL,
    rent_id        INTEGER          NOT NULL DEFAULT -1,
    door_height    INTEGER          NOT NULL,
    door_height_id INTEGER          NOT NULL DEFAULT -1,
    door_width     INTEGER          NOT NULL,
    door_width_id  INTEGER          NOT NULL DEFAULT -1,
    features       VARCHAR(64)      NOT NULL,
    popularity     INTEGER          NOT NULL
);

create index e1 on isuumo.estate (popularity);

create index estate_rent_id_popularity on isuumo.estate (rent_id);
create index estate_rent_id_door_height_id on isuumo.estate (rent_id, door_height_id);
create index estate_rent_id_door_width_id on isuumo.estate (rent_id, door_width_id);
create index estate_rent_id_door_width_id_door_height_id on isuumo.estate (rent_id, door_width_id, door_height_id);
create index estate_door_width_id on isuumo.estate (door_width_id);
create index estate_door_height_id on isuumo.estate (door_height_id);
create index estate_door_width_id_door_height_id on isuumo.estate (door_width_id, door_height_id);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL
);
/*
MySQL [isuumo]> explain SELECT * FROM chair WHERE stock > 0 ORDER BY price ASC, id ASC LIMIT 20;
+----+-------------+-------+------------+------+---------------+------+---------+------+-------+----------+-----------------------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra                       |
+----+-------------+-------+------------+------+---------------+------+---------+------+-------+----------+-----------------------------+
|  1 | SIMPLE      | chair | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 28907 |    33.33 | Using where; Using filesort |
+----+-------------+-------+------------+------+---------------+------+---------+------+-------+----------+-----------------------------+
*/
create index i1 on isuumo.chair (price);
