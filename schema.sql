-- Weather Tables

-- Avoid duplicates when loading data into tables
DROP TABLE IF EXISTS Weather CASCADE;
CREATE TABLE Weather (
    station VARCHAR(15),
    "date" DATE PRIMARY KEY
);

DROP TABLE IF EXISTS Wind CASCADE;
CREATE TABLE Wind (
    "date" DATE REFERENCES Weather,
    avgwind NUMERIC(4,2)
);

DROP TABLE IF EXISTS Precipitation CASCADE;
CREATE TABLE Precipitation (
    "date" DATE REFERENCES Weather,
    precip NUMERIC(4,2),
    snow NUMERIC(4,2),
    snowdepth NUMERIC(4,2)
);

DROP TABLE IF EXISTS Temperature CASCADE;
CREATE TABLE Temperature (
    "date" DATE REFERENCES Weather,
    maxtemp SMALLINT,
    mintemp SMALLINT
);

DROP TABLE IF EXISTS Wtypes CASCADE;
CREATE TABLE Wtypes (
    "date" DATE REFERENCES Weather,
    -- Some weather types ommitted due to never occuring in NYC (I.E volcanic ash)
    WT01 BOOLEAN,
    WT02 BOOLEAN,
    WT03 BOOLEAN,
    WT04 BOOLEAN,
    WT06 BOOLEAN,
    WT08 BOOLEAN,
    WT11 BOOLEAN,
    WT13 BOOLEAN,
    WT14 BOOLEAN,
    WT16 BOOLEAN,
    WT18 BOOLEAN,
    WT19 BOOLEAN,
    WT22 BOOLEAN
);

/*
DROP TABLE IF EXISTS Typecode CASCADE;
CREATE TABLE Typecode (
   code VARCHAR(7) PRIMARY KEY,
   meaning VARCHAR(127)
);
*/



-- Collision Tables

DROP TABLE IF EXISTS Crash CASCADE;
CREATE TABLE Crash (
    id VARCHAR(15) PRIMARY KEY,
    "datetime" TIMESTAMP WITHOUT TIME ZONE
);

DROP TABLE IF EXISTS Location CASCADE;
CREATE TABLE Location (
    id VARCHAR(15) REFERENCES Crash,
    borough VARCHAR(31),
    zip VARCHAR(7),
    latitude NUMERIC(9,6),
    longitude NUMERIC(9,6),
    on_st VARCHAR(63),
    cross_st VARCHAR(63),
    off_st VARCHAR(63)
);

DROP TABLE IF EXISTS Injuries CASCADE;
CREATE TABLE Injuries (
    id VARCHAR(15) REFERENCES Crash,
    total SMALLINT,
    pedestrians SMALLINT,
    cyclists SMALLINT,
    motorists SMALLINT
);

DROP TABLE IF EXISTS Deaths CASCADE;
CREATE TABLE Deaths (
    id VARCHAR(15) REFERENCES Crash,
    total SMALLINT,
    pedestrians SMALLINT,
    cyclists SMALLINT,
    motorists SMALLINT
);

DROP TABLE IF EXISTS VehiclesFactors CASCADE;
CREATE TABLE VehiclesFactors (
    id VARCHAR(15) REFERENCES Crash,
    type_vehicle1 VARCHAR(63),
    type_vehicle2 VARCHAR(63),
    type_vehicle3 VARCHAR(63),
    type_vehicle4 VARCHAR(63),
    type_vehicle5 VARCHAR(63),
    contrib_factor1 VARCHAR(63),
    contrib_factor2 VARCHAR(63),
    contrib_factor3 VARCHAR(63),
    contrib_factor4 VARCHAR(63),
    contrib_factor5 VARCHAR(63)
);
