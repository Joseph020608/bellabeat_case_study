DROP TABLE IF EXISTS daily_activity_raw;

CREATE TABLE daily_activity_raw (
ID BIGINT,
ActivityDate VARCHAR(10),
TotalSteps INT,
TotalDistance DECIMAL(10,4),
TrackerDistance DECIMAL(10,4),
LoggedActivitiesDistance DECIMAL(10,4),
VeryActiveDistance DECIMAL(10,4),
ModeratelyActiveDistance DECIMAL(10,4),
LightActiveDistance DECIMAL(10,4),
SedentaryActiveDistance DECIMAL(10,4),
VeryActiveMinutes INT,
FairlyActiveMinutes INT,
LightlyActiveMinutes INT,
SedentaryMinutes INT,
Calories INT
);

SELECT COUNT(*) AS total_count,
	COUNT(DISTINCT Id)AS unique_users
FROM daily_activity_raw;

DROP TABLE IF EXISTS daily_activity_clean;

CREATE TABLE daily_activity_clean AS 
SELECT
	Id,
    str_to_date(ActivityDate, '%m/%d/%Y') AS ActivityDate,
    TotalSteps,
    TotalDistance,
    TrackerDistance,
    LoggedActivitiesDistance,
    VeryActiveDistance,
    ModeratelyActiveDistance,
    LightActiveDistance,
    SedentaryActiveDistance,
    VeryActiveMinutes,
    FairlyActiveMinutes,
    LightlyActiveMinutes,
    SedentaryMinutes,
    Calories
FROM daily_activity_raw
WHERE str_to_date(ActivityDate, '%m/%d/%Y') IS NOT NULL;

SELECT *
FROM daily_activity_clean
WHERE TotalSteps < 0 OR calories < 0;

SELECT Id, calories, ActivityDate, SedentaryMinutes
FROM daily_activity_clean
WHERE TotalSteps = 0 AND SedentaryMinutes = 1440
GROUP BY Id, calories, ActivityDate, SedentaryMinutes;


DROP VIEW IF EXISTS daily_activity_filtered;

CREATE VIEW daily_activity_filtered AS
	SELECT Id,
    ActivityDate,
    TotalSteps,
    TotalDistance,
    TrackerDistance,
    LoggedActivitiesDistance,
    VeryActiveDistance,
    ModeratelyActiveDistance,
    LightActiveDistance,
    SedentaryActiveDistance,
    VeryActiveMinutes,
    FairlyActiveMinutes,
    LightlyActiveMinutes,
    SedentaryMinutes,
    Calories
FROM daily_activity_clean
WHERE NOT (TotalSteps = 0 AND SedentaryMinutes = 1440)
;

SELECT COUNT(*) FROM daily_activity_filtered;

SELECT COUNT(*) FROM daily_activity_clean;