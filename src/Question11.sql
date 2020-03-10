-- -----------------------------------------------------
-- Question 11
-- -----------------------------------------------------
SELECT Paying.idLocation,
	Occupants.NumOccupants,
	Location.StreetNumber,
    Location.StreetNumberSuffix,
    Location.StreetName,
    Location.StreetType,
    Location.MinorMunicipality,
    Location.MajorMunicipality,
    Location.GoverningDistrict,
    Location.PostalArea,
    Location.Country
FROM (
	SELECT DISTINCT Location.idLocation
	FROM Location INNER JOIN ConsumerLocation INNER JOIN Licence INNER JOIN Software
	ON Location.idLocation = ConsumerLocation.idLocation
	AND ConsumerLocation.UserName = Licence.UserName
	AND Licence.SoftwareId = Software.SoftwareId
	WHERE Software.Price > 0
	GROUP BY Location.idLocation
) Paying INNER JOIN (
	SELECT COUNT(ConsumerLocation.idLocation) AS NumOccupants, ConsumerLocation.idLocation
    FROM ConsumerLocation
    GROUP BY ConsumerLocation.idLocation
) Occupants INNER JOIN Location
ON Paying.idLocation = Occupants.idLocation
AND Paying.idLocation = Location.idLocation
ORDER BY NumOccupants DESC
LIMIT 10