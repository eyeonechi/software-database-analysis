-- -----------------------------------------------------
-- Question 10
-- -----------------------------------------------------
SELECT COUNT(DISTINCT Software.Name) AS SoftwareInstalled
FROM Software INNER JOIN Licence INNER JOIN Consumer INNER JOIN ConsumerLocation INNER JOIN Location
ON Software.SoftwareId = Licence.SoftwareId
AND Licence.UserName = Consumer.UserName
AND Consumer.UserName = ConsumerLocation.UserName
AND ConsumerLocation.idLocation = Location.idLocation
WHERE Software.CurrentVersion = 1
AND Licence.Installed = TRUE
AND Location.Country = "Australia"
ORDER BY Software.Name
/*
SELECT COUNT(DISTINCT Software.Name) AS SoftwareInstalled
FROM Software
WHERE Software.CurrentVersion = 1
AND EXISTS (
	SELECT *
    FROM Licence
    WHERE Software.SoftwareId = Licence.SoftwareId
    AND Licence.Installed = TRUE
    AND EXISTS (
		SELECT *
		FROM Consumer
		WHERE Licence.UserName = Consumer.UserName
		AND EXISTS (
			SELECT *
			FROM ConsumerLocation
			WHERE Consumer.UserName = ConsumerLocation.UserName
			AND EXISTS (
				SELECT *
				FROM Location
				WHERE ConsumerLocation.idLocation = Location.idLocation
			)
        )
    )
)
ORDER BY Software.Name
*/