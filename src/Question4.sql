-- -----------------------------------------------------
-- Question 4
-- -----------------------------------------------------
SELECT COUNT(DISTINCT Software.SoftwareId) AS NumApps
FROM Software INNER JOIN Platform
ON Software.idPlatform = Platform.idPlatform
WHERE Platform.Name = "iOS"
AND Software.DistributionCost < (0.2 * Software.Price)
