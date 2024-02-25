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

ALTER TABLE dummy
MODIFY COLUMN  Owns_Car VARCHAR(5);

UPDATE dummy
SET indebt = 'TRUE'
WHERE indebt = '1';

UPDATE dummy
SET isHomeOwner = 'TRUE'
WHERE isHomeOwner = '1';

UPDATE dummy
SET Owns_Car = 'FALSE'
WHERE Owns_Car = '0';

SELECT DISTINCT gender
FROM dummy;

UPDATE dummy
SET gender = 'None'
WHERE gender = 'non-binary';

SELECT Gender, platform, COUNT(*) AS count
FROM dummy
GROUP BY Gender, platform
ORDER BY Gender , COUNT(*) DESC ;

SELECT AVG(age) AS AvgAge
FROM dummy;

SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS AgeGroup,
    AVG(TimeSpent) AS AverageTimeSpent
FROM dummy
GROUP BY AgeGroup
ORDER BY AgeGroup;


SELECT
  Gender,
  COUNT(*) AS UserCount
FROM dummy
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY UserCount DESC;


SELECT Gender, platform, FLOOR(AVG(TimeSpent)) AS AvgTimeSpent
FROM dummy
GROUP BY Gender, platform
ORDER BY Gender, platform;

# What is the average time spent on the platform across all users?

SELECT  COUNT(Gender) AS USERS , platform ,  FLOOR(AVG(TimeSpent)) AS AvgTime
FROM dummy
GROUP BY platform;

SELECT COUNT(Gender) AS USERS , profession, TimeSpent
FROM dummy
GROUP BY profession , TimeSpent
ORDER BY profession DESC;

# How do interests correlate with time spent on the platform?

SELECT COUNT(Gender) AS USERS, interests
FROM dummy
GROUP BY profession , interests
ORDER BY profession DESC;

SELECT COUNT(Gender) AS USERS , Demographics, interests
FROM dummy
GROUP BY Demographics, interests
ORDER BY demographics;

# What is the average income across different professions in your user base?
SELECT
    profession,
    AVG(AvgIncome) AS AvgIncome, -- Average income per profession
    AVG(gender_count) AS average_gender_count -- Average count of each gender per profession
FROM (
    SELECT
        profession,
        Gender,
        COUNT(*) AS gender_count, -- Count of each gender within the profession
        AVG(income) AS AvgIncome -- Average income for each gender within the profession
    FROM dummy
    GROUP BY profession, Gender
) AS subquery
GROUP BY profession;

#How does the profession affect platform usage patterns?

SELECT profession, platform
FROM dummy
ORDER BY profession;

# What percentage of your users are in debt?

SELECT COUNT(Gender) AS USERS , indebt
FROM dummy
GROUP BY indebt
# Export
