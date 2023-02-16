-- Question 1
-- What range of years for baseball games played does the provided database cover? 

SELECT 
	MIN(yearid) AS earliest,
	MAX(yearid) AS latest
FROM teams;

SELECT 
	MIN(yearid) AS earliest,
	MAX(yearid) AS latest
FROM batting;

--The range of years covered is 1871 to 2016