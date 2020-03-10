-- -----------------------------------------------------
-- Question 3
-- -----------------------------------------------------
-- Creates a new Location instance
INSERT IGNORE INTO Location Values (
	DEFAULT,
	123,
	"",
	"Fake",
	"Street",
	"Fakeville",
	"Melbourne",
	"Victoria",
	"9999",
	"Australia"
);

SET @LID = LAST_INSERT_ID();
SET @DID = "2016-07-10";
SET @CID = (
	SELECT Consumer.UserName
	FROM Consumer
	WHERE Consumer.FirstName = "Ivan Ken Weng"
	AND Consumer.LastName = "Chee"
);

-- Updates ValidTo date of pre-existing Location
UPDATE ConsumerLocation
SET ConsumerLocation.ValidTo = @DID
WHERE ConsumerLocation.UserName = @CID;

-- Creates a new ConsumerLocation instance to
-- link the new location instance to myself
INSERT INTO ConsumerLocation VALUES (
	@CID,
    @LID,
    @DID,
    NULL
);
