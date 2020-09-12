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

create index estate_rent_id on isuumo.estate (rent_id);
create index estate_rent_id on isuumo.estate (rent_id, door_height);
create index estate_rent_id_door_width on isuumo.estate (rent_id, door_width);
create index estate_rent_id_door_width_door_height on isuumo.estate (rent_id, door_width);
create index estate_door_width on isuumo.estate (door_width);
create index estate_door_height on isuumo.estate (door_height);
create index estate_door_width_door_height on isuumo.estate (door_width, door_height);

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
