USE socialmedia;

CREATE TABLE dummy (
    age int,
    gender varchar(255),
    time_spent int,
    platform varchar(255),
    interests varchar(255),
    demographics varchar(255),
    profession varchar(255),
    income int,
    indebt BOOLEAN,
    isHomeOwner BOOLEAN,
    Owns_Car BOOLEAN

);



SELECT * FROM dummy;

UPDATE dummy SET indebt = TRUE WHERE indebt = 1;
UPDATE dummy SET indebt = FALSE WHERE indebt = 0;

UPDATE dummy SET isHomeOwner = TRUE WHERE isHomeOwner = 1;
UPDATE dummy SET isHomeOwner = FALSE WHERE isHomeOwner = 0;

UPDATE dummy SET Owns_Car = TRUE WHERE Owns_Car = 1;
UPDATE dummy SET Owns_Car = FALSE WHERE Owns_Car = 0;
DESCRIBE dummy;