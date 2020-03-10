-- -----------------------------------------------------
-- Question 9
-- -----------------------------------------------------
SELECT DISTINCT Software.Name,
				SUBSTRING_INDEX(SUBSTRING_INDEX(Software.Website, 'http://', - 1), '/', 1) AS Domain
FROM Software
WHERE Software.SoftwareId NOT IN (
	Select DISTINCT Licence.SoftwareId
    FROM Licence
)
ORDER BY Software.Name
/*
SELECT DISTINCT Software.Name, Software.Website
FROM Software
WHERE NOT EXISTS (
	SELECT *
    FROM Licence
    WHERE Software.SoftwareId = Licence.SoftwareId
)
ORDER BY Software.Name
*/