-- -----------------------------------------------------
-- Question 12
-- -----------------------------------------------------
SELECT DISTINCT Consumer.UserName, Consumer.FirstName, Consumer.LastName
FROM Consumer
WHERE Consumer.UserName NOT IN (
	SELECT DISTINCT ConsumerLocation.UserName
    FROM ConsumerLocation
)
/*
SELECT DISTINCT Consumer.FirstName, Consumer.LastName
FROM Consumer
WHERE EXISTS (
	SELECT *
    FROM ConsumerLocation
)
*/