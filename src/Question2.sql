-- -----------------------------------------------------
-- Question 2
-- -----------------------------------------------------

SET @EID = 0;
SET @JID = 0;
SET @PID = 0;
SET @SID = 0;

SET @JID = @JID + 1;
INSERT IGNORE INTO JobTitle VALUES (
	@JID,
    "CEO",
    250.00
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "Mitchell",
    "Harrop"
);

SET @JID = @JID + 1;
INSERT IGNORE INTO JobTitle VALUES (
	@JID,
    "CFO",
    250.00
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "Ida",
    "Asadi Someh"
);

SET @JID = @JID + 1;
INSERT IGNORE INTO JobTitle VALUES (
	@JID,
    "Software Developer",
    50.00
);

-- -----------------------------------------------------
-- Consumer 1
-- -----------------------------------------------------
INSERT IGNORE INTO Consumer VALUES (
    "ichee",
	"Ivan Ken Weng",
	"Chee",
	"ichee@student.unimelb.edu.au"
);

SET @CID = "ichee";
INSERT IGNORE INTO Location VALUES (
	DEFAULT,
    1,
    "Some Suffix",
    "Some",
    "Street",
    "Some Minor Municipality",
    "Some Major Municipality",
    "Some Governing District",
    "1234",
    "Batmania"
);

SET @LID = LAST_INSERT_ID();
INSERT IGNORE INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-09-28",
    NULL
);

SET @PID = @PID + 1;
INSERT IGNORE INTO Platform VALUES (
	@PID,
    "iOS"
);

SET @SID = @SID + 1;
INSERT IGNORE INTO Software VALUES (
	@SID,
    "Gougle Docs",
    1,
    1000.00,
    250.00,
    @PID,
    "Professional software collection to edit and view various document formats",
    2016,
    "http://docs.gougle.com"
);

INSERT IGNORE INTO Licence VALUES (
	@SID,
    @CID,
    "2016-09-28",
    TRUE
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "Will",
    "Gates"
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID,
    @JID
);

-- -----------------------------------------------------
-- Consumer 2
-- -----------------------------------------------------
INSERT IGNORE INTO Consumer VALUES (
    "batman",
	"Bruce",
	"Wayne",
	"thedarknight@dccomics.com"
);

SET @CID = "batman";
INSERT IGNORE INTO Location VALUES (
	DEFAULT,
    1007,
    "Wayne Manor",
    "Mountain",
    "Drive",
    "Wayne Enterprises",
    "Gotham City",
    "New Jersey",
    "0000",
    "United States"
);

SET @LID = LAST_INSERT_ID();
INSERT IGNORE INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-09-29",
    NULL
);

SET @PID = @PID + 1;
INSERT IGNORE INTO Platform VALUES (
	@PID,
    "OS X"
);

SET @SID = @SID + 1;
INSERT IGNORE INTO Software VALUES (
	@SID,
    "Gougle Music",
    10,
    45.00,
    10.00,
    @PID,
    "Synchronise your music, videos and podcasts to all your Gougle devices",
    2015,
    "http://music.gougle.com"
);

INSERT IGNORE INTO Licence VALUES (
	@SID,
    @CID,
    "2016-09-29",
    FALSE
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "Steve",
    "Hobs"
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 1,
    @JID
);

-- -----------------------------------------------------
-- Consumer 3
-- -----------------------------------------------------
INSERT IGNORE INTO Consumer VALUES (
    "harry",
	"Harry",
	"Potter",
	"harry@hogwarts.com"
);

SET @CID = "harry";
INSERT IGNORE INTO Location VALUES (
	DEFAULT,
    4,
    "Stair Cupboard",
    "Privet",
    "Drive",
    "Little Whinging",
    "Surrey",
    "London",
    "1511",
    "England"
);

SET @LID = LAST_INSERT_ID();
INSERT IGNORE INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-09-30",
    NULL
);

SET @PID = @PID + 1;
INSERT IGNORE INTO Platform VALUES (
	@PID,
    "Windows"
);

SET @SID = @SID + 1;
INSERT IGNORE INTO Software VALUES (
	@SID,
    "Gougle Chrome",
    6,
    0.00,
    10.00,
    @PID,
    "Fastest way to browse the web. Download using Microhard Internet Explorer 11",
    2010,
    "http://www.chrome.com"
);

INSERT IGNORE INTO Licence VALUES (
	@SID,
    @CID,
    "2016-09-30",
    TRUE
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "Mark",
    "Juckerberg"
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 1,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 2,
    @JID
);

-- -----------------------------------------------------
-- Consumer 4
-- -----------------------------------------------------
INSERT IGNORE INTO Consumer VALUES (
    "ironman",
	"Tony",
	"Stark",
	"ironman@avengers.com"
);

SET @CID = "ironman";
INSERT IGNORE INTO Location VALUES (
	DEFAULT,
    10880,
    "Stark Malibu Mansion",
    "Malibu",
    "Point",
    "Point Dume",
    "Malibu",
    "California",
    "9026",
    "United States"
);

SET @LID = LAST_INSERT_ID();
INSERT IGNORE INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-10-01",
    NULL
);

SET @PID = @PID + 1;
INSERT IGNORE INTO Platform VALUES (
	@PID,
    "Android"
);

SET @SID = @SID + 1;
INSERT IGNORE INTO Software VALUES (
	@SID,
    "Gougle Drive",
    3,
    25.00,
    15.00,
    @PID,
    "Access all your data on the cloud, anytime, anywhere",
    2014,
    "http://drive.gougle.com"
);

INSERT IGNORE INTO Licence VALUES (
	@SID,
    @CID,
    "2016-10-01",
    FALSE
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "John",
    "Ranke"
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 1,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 2,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 3,
    @JID
);

-- -----------------------------------------------------
-- Consumer 5
-- -----------------------------------------------------
INSERT IGNORE INTO Consumer VALUES (
    "spiderman",
	"Peter",
	"Parker",
	"spiderman@notavengers.com"
);

SET @CID = "spiderman";
INSERT IGNORE INTO Location VALUES (
	DEFAULT,
    20,
    "Aunt May's Home",
    "Ingram",
    "Street",
    "Forest Hills Gardens",
    "Flushing",
    "New York",
    "1375",
    "United States"
);

SET @LID = LAST_INSERT_ID();
INSERT IGNORE INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    "2016-10-02",
    NULL
);

SET @PID = @PID + 1;
INSERT IGNORE INTO Platform VALUES (
	@PID,
    "PlayStation"
);

SET @SID = @SID + 1;
INSERT IGNORE INTO Software VALUES (
	@SID,
    "Gougle PlayStore",
    4,
    0.00,
    3.00,
    @PID,
    "Download apps and games from the largest repository of mobile apps",
    2011,
    "http://play.gougle.com"
);

INSERT IGNORE INTO Licence VALUES (
	@SID,
    @CID,
    "2016-10-02",
    FALSE
);

SET @EID = @EID + 1;
INSERT IGNORE INTO Staff VALUES (
	@EID,
    "Ryan",
    "Kernighan"
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 1,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 2,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 3,
    @JID
);

INSERT IGNORE INTO Development VALUES (
	@SID,
    @EID - 4,
    @JID
);
