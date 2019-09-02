CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);

INSERT INTO flights (origin, destination, duration) VALUES ('Shangai', 'Paris', 415);
INSERT INTO flights (origin, destination, duration) VALUES ('Istanbul', 'Tokyo', 760);
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'Paris', 435);
INSERT INTO flights (origin, destination, duration) VALUES ('Moscow', 'Paris', 245);
INSERT INTO flights (origin, destination, duration) VALUES ('Lima', 'New York', 455);

UPDATE flights
    SET duration = 430
    WHERE origin = 'New York'
    AND destination = 'London';

DELETE FROM flights
    WHERE destination = 'Tokyo';

SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1;

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
);

INSERT INTO passengers (name, flight_id) VALUES ('Alice', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Bob', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Charlie', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Dave', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Erin', 4);
INSERT INTO passengers (name, flight_id) VALUES ('Frank', 6);
INSERT INTO passengers (name, flight_id) VALUES ('Grace', 6);

SELECT origin, destination, name FROM flights JOIN passengers ON
passengers.flight_id = flights.id;

SELECT origin, destination, name FROM flights LEFT JOIN passengers ON
passengers.flight_id = flights.id;

SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1;

SELECT * FROM flights WHERE id IN 
(SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1);

// postgresql://postgres:Cibocira2001@localhost:5432/postgres