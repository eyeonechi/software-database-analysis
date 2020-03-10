-- -----------------------------------------------------
-- Question 8
-- -----------------------------------------------------
SELECT DISTINCT COUNT(Licence.PurchaseTime) AS TimesPurchased,
				Software.SoftwareId,
                Software.Name,
                Software.Price,
                Software.Description,
                Software.Website
FROM Licence INNER JOIN Software
ON Licence.SoftwareId = Software.SoftwareId
WHERE Software.Price > 0
GROUP BY Licence.SoftwareId, Software.Name
HAVING BINARY(Software.Name) REGEXP '^[i]'
OR BINARY(Software.Name) REGEXP '^[e]'
ORDER BY TimesPurchased DESC
LIMIT 10;
