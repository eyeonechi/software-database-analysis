-- -----------------------------------------------------
-- Question 6
-- -----------------------------------------------------
SELECT Developers.idStaff,
		Developers.OfficialJobTitle,
		Developers.FirstName,
		Developers.LastName,
		COUNT(iOS.SoftwareId) AS NumiOSApps
FROM (
	SELECT DISTINCT Development.idStaff,
					JobTitle.OfficialJobTitle,
                    Staff.FirstName,
                    Staff.LastName,
                    Software.SoftwareId
	FROM Development INNER JOIN Staff INNER JOIN Software INNER JOIN JobTitle
	ON Development.idStaff = Staff.idStaff
    AND Development.idJobTitle = JobTitle.idJobTitle
	AND Development.SoftwareId = Software.SoftwareId
	WHERE JobTitle.OfficialJobTitle = "Software Developer"
	GROUP BY Development.idStaff, Software.SoftwareId
) Developers LEFT JOIN (
	SELECT Software.SoftwareId
	FROM Development INNER JOIN Software INNER JOIN Platform
	ON Development.SoftwareId = Software.SoftwareId
	AND Software.idPlatform = Platform.idPlatform
	WHERE Platform.Name = "iOS"
) iOS
ON Developers.SoftwareId = iOS.SoftwareId
GROUP BY Developers.idStaff
