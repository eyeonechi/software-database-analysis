-- -----------------------------------------------------
-- Question 7
-- -----------------------------------------------------
SELECT Development.idStaff,
		Staff.FirstName,
        Staff.LastName,
        COUNT(Development.idStaff) AS NumProjects
FROM Staff INNER JOIN Development
ON Staff.idStaff = Development.idStaff
GROUP BY Development.idStaff
HAVING COUNT(Development.idStaff) = (
	SELECT MAX(Developers.NumProjects) AS MaxProjects
	FROM Staff INNER JOIN (
		SELECT Development.idStaff, COUNT(Development.idStaff) AS NumProjects
		FROM Staff INNER JOIN Development
		ON Staff.idStaff = Development.idStaff
		GROUP BY Development.idStaff
	) Developers
    ON Staff.idStaff = Developers.idStaff
)
OR COUNT(Development.idStaff) = (
	SELECT MIN(Developers.NumProjects) AS MinProjects
	FROM Staff INNER JOIN (
		SELECT Development.idStaff, COUNT(Development.idStaff) AS NumProjects
		FROM Staff INNER JOIN Development
		ON Staff.idStaff = Development.idStaff
		GROUP BY Development.idStaff
	) Developers
    ON Staff.idStaff = Developers.idStaff
)
