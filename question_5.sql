-- Question 5
-- Find the average number of strikeouts per game by decade since 1920. 
-- Round the numbers you report to 2 decimal places. 
-- Do the same for home runs per game. Do you see any trends?

-- Find: avg strikeouts per game per decade where decade >= 1920, round to 2 dp, avg home runs per game per decade where decade >= 1920, round to 2 dp

SELECT SUM(HR)
FROM battingpost

