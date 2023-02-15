-- Question 5
-- Find the average number of strikeouts per game by decade since 1920. 
-- Round the numbers you report to 2 decimal places. 
-- Do the same for home runs per game. Do you see any trends?

-- Find: avg strikeouts per game per decade where decade >= 1920, round to 2 dp, avg home runs per game per decade where decade >= 1920, round to 2 dp
-- Given: teams
-- Assumptions: the soa and hra should be included because each game is counted twice since data is recorded by team and each game has 2 teams
-- Columns input: so, soa, hr, hra
-- Columns output: decade, avg_strikouts, avg_homeruns (to 2 decimal places)

SELECT
	dec.decade,
	ROUND(AVG((t.SO+t.SOA)/t.G), 2) AS avg_strikouts,
	ROUND(AVG((t.HR+t.HRA)/t.G), 2) AS avg_homeruns
FROM teams AS t
	INNER JOIN (SELECT CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
							WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
							WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
							WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
							WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
							WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
							WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
							WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
							WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
							WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s' END AS decade,
					yearid,
					teamid,
					lgid
			  FROM teams) AS dec
	USING(yearid, teamid, lgid)
WHERE yearid >= 1920
GROUP BY decade
ORDER BY LEFT(decade, 4)::integer;
