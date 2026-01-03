SELECT DAYNAME(ActivityDate) AS day_of_week, AVG(TotalSteps) AS AVG_steps, AVG(Calories) AS AVG_calories
FROM daily_activity_filtered
GROUP BY DAYNAME(ActivityDate)
ORDER BY AVG_steps DESC;

SELECT ROUND(AVG(TotalSteps), 2) AS AVG_steps,
	ROUND(AVG(Calories), 2) AS AVG_calories,
    ROUND(AVG(SedentaryMinutes), 2) AS AVG_sedentary_minutes, 
    ROUND(AVG(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes), 2) AS AVG_active_minutes
FROM daily_activity_filtered;

SELECT Id, AVG(TotalSteps) AS AVG_steps, AVG(calories) AS AVG_calories
FROM daily_activity_filtered
GROUP BY Id;

SELECT
CASE 
    WHEN TotalSteps >= 1 AND TotalSteps < 12000 THEN 'Sedentary'
    WHEN TotalSteps >= 12000 AND TotalSteps < 24000 THEN 'Lightly active'
    WHEN TotalSteps > 24000 THEN 'Active'
    ELSE 'Non Applies'
END AS Activity_Level,
COUNT(*) AS number_times
FROM daily_activity_filtered
GROUP BY Activity_Level