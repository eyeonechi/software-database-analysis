-- -----------------------------------------------------
-- Question 5
-- -----------------------------------------------------
SELECT Decades.Decade, COUNT(DISTINCT Software.SoftwareId) AS iOSApps
FROM Software INNER JOIN (
	SELECT Software.SoftwareId, FLOOR(Software.YearOfRelease / 10) * 10 AS Decade
	FROM Software INNER JOIN Platform
	ON Software.idPlatform = Platform.idPlatform
	WHERE Platform.Name = "iOS"
	GROUP BY Software.SoftwareId
	HAVING Decade < 2010
) Decades
ON Decades.SoftwareId = Software.SoftwareId
GROUP BY Decades.Decade