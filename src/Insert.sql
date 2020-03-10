SET @PID = (
	SELECT Platform.idPlatform
    FROM Platform
	WHERE Platform.Name = "iOS"
);

SET @SID = 1 + (
	SELECT MAX(Software.SoftwareId)
    FROM Software
);

INSERT INTO Software VALUES (
	@SID,
    "iTunes",
	1,
    80.00,
    850.00,
    @PID,
    "Buy and listen to music and synchronise your mobile devices",
    1995,
    "http://www.itunes.com/"
) ON DUPLICATE KEY UPDATE
Name = "iTunes",
CurrentVersion = 1,
Price = 80.00,
DistributionCost = 850.00,
idPlatform = @PID,
Description = "Buy and listen to music and synchronise your mobile devices",
YearOfRelease = 1995,
Website = "http://www.itunes.com/";

SET @EID = (
	SELECT Staff.idStaff
    FROM Staff
    WHERE Staff.FirstName = "Ryan"
    AND Staff.LastName = "Kernighan"
);

SET @JID = (
	SELECT JobTitle.idJobTitle
    FROM JobTitle
    WHERE JobTitle.OfficialJobTitle = "Software Developer"
);

INSERT INTO Development VALUES (
	@SID,
    @EID,
    @JID
);

SET @LID = (
	SELECT Location.idLocation
    FROM Location
    WHERE Location.MajorMunicipality = "Melbourne"
);

INSERT INTO Consumer VALUES (
	"somebody",
    "Somebody",
    "Else",
    "somebody@something.com"
);

SET @CID = "somebody";

INSERT INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-10-09",
    NULL
);

SET @LID = (
	SELECT Location.idLocation
    FROM Location
    WHERE Location.MajorMunicipality = "Melbourne"
);

INSERT INTO Consumer VALUES (
	"nobody",
    "Nobody",
    "Here",
    "nobody@nothing.com"
);

SET @CID = "nobody";

INSERT INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-10-09",
    NULL
);

INSERT INTO Consumer VALUES (
	"ctew",
    "Clement Shu Huan",
    "Tew",
    "ctew@student.unimelb.edu.au"
);
/*
INSERT INTO Staff (idStaff, FirstName)VALUES (1, 'Harry');
INSERT INTO Staff (idStaff, FirstName)VALUES (2, 'Mitchell'); 
INSERT INTO Staff (idStaff, FirstName)VALUES (3, 'Max');
INSERT INTO Staff (idStaff, FirstName)VALUES (4, 'Howard');
INSERT INTO Staff (idStaff, FirstName)VALUES (5, 'Ana');
Insert into JobTitle VALUES (1, 'Software Developer', 16);

Insert into JobTitle VALUES (2, 'Designer', 20);

Insert into JobTitle VALUES (3, 'Director', 30);

Insert into JobTitle VALUES (4, 'Database Designer', 0.5);
INSERT INTO Development VALUES (3, 1, 2);
INSERT INTO DevelopmentVALUES (3, 1, 3);
INSERT INTO DevelopmentVALUES (4, 2, 4);
INSERT INTO DevelopmentVALUES (1, 2, 1);

INSERT INTO DevelopmentVALUES (2, 3, 1);

INSERT INTO DevelopmentVALUES (4, 3, 4);

INSERT INTO DevelopmentVALUES (4, 5, 4);

INSERT INTO DevelopmentVALUES (4, 4, 1);

INSERT INTO DevelopmentVALUES (4, 3, 1);
*/