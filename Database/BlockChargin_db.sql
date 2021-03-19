


------------------------
DROP TABLE vehicles;
DROP TABLE clients;
DROP TABLE stations;

CREATE TABLE stations (
    station_id INT PRIMARY KEY,
    latitude Decimal(8,6),
    longitude Decimal(9,6),
    company VARCHAR(30)
);
CREATE TABLE clients (
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(10),
    birthday DATE
);

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    brand VARCHAR(10),
    model VARCHAR(10),
    year INT,
    owner_id INT,
    FOREIGN KEY(owner_id) REFERENCES clients(id) ON DELETE SET NULL
);

-- Corporate ---
INSERT INTO stations VALUES(1, 38.73704, -9.13877, 'Instituto Superior Tecnico');
INSERT INTO stations VALUES(2, 38.75657, -9.17618, 'Galp|Sede');
INSERT INTO stations VALUES(3, 38.76130, -9.09455, 'Microsoft Portugal');
INSERT INTO stations VALUES(4, 38.72994, -9.10785, 'iMatch');


INSERT INTO clients VALUES(1, 'Ines', 'Moreira', '1998-05-07');
INSERT INTO clients VALUES(2, 'Mauro', 'Pungo', '1998-05-07');
INSERT INTO clients VALUES(3, 'Jônatas', 'Manzolli', '1990-06-24');
INSERT INTO clients VALUES(4, 'Irvylle', 'Cavalcante', '1998-05-07');
INSERT INTO clients VALUES(5, 'Jamilson', 'Junior', '1997-09-20');


INSERT INTO vehicles VALUES(1, 'Tesla', 'Model S', '2020', 1);
INSERT INTO vehicles VALUES(2, 'Audi', 'A8', '2018', 1);
INSERT INTO vehicles VALUES(3, 'Ford', 'Fiesta', '2016', 2);
INSERT INTO vehicles VALUES(4, 'Nissan', 'Leaf', '2018', 3);
INSERT INTO vehicles VALUES(5, 'Jaguar', 'I-PACE', '2021', 3);
INSERT INTO vehicles VALUES(6, 'Chevrolet', 'Bolt', '2019', 4);
INSERT INTO vehicles VALUES(7, 'Kia', 'Niro', '2018', 5);

SELECT * from vehicles;
SELECT * from clients;
SELECT * from stations;

SELECT clients.id, QTY.quantity FROM clients
LEFT JOIN
    (SELECT COUNT(vehicles.owner_id) AS quantity, vehicles.owner_id FROM vehicles GROUP BY vehicles.owner_id) AS QTY
ON clients.id = QTY.owner_id

