-- Question 7
-- From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
-- What is the smallest number of wins for a team that did win the world series? 
-- Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. 
-- Then redo your query, excluding the problem year. 
-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 
-- What percentage of the time?

/* 
Find: 
- largest number of wins for team that did not win world series 
- smallest number of wins for team that did win world series
- problem year
- redo, excluding problem year
- most wins AND won ws/total ws * 100

Given: teams, yearid between 1970 and 2016 

Column input: yearid, W, L, WSWin
Column output: */

SELECT
	yearid,
	W,
	L,
	WSWin
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 
	AND wswin = 'N';
GROUP BY yearid, teamid

SELECT MAX(W) AS most_wins_with_no_ws
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 
	AND wswin = 'N';
-- Most wins = 116
	
SELECT MIN(W) AS least_wins_with_ws
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 
	AND wswin = 'Y';
-- Least wins = 63
		
SELECT *
FROM teams
WHERE wswin = 'Y'
	AND W = (SELECT MIN(W)
				FROM teams
				WHERE yearid BETWEEN 1970 AND 2016 
					AND wswin = 'Y')

SELECT MIN(W) AS least_wins_with_ws_no_1981
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 
	AND wswin = 'Y'
	AND yearid <> 1981;
-- Least wins (omitting 1981) = 83

SELECT COUNT(*)
FROM teams
LEFT JOIN (SELECT
				yearid,
				lgid,
				teamid,
				MAX(W)OVER(PARTITION BY yearid) AS most_wins,
		   		1 AS counter
			FROM teams) AS mw
USING(yearid, lgid, teamid)		
WHERE yearid BETWEEN 1970 AND 2016
	AND wswin = 'Y'
	AND w = most_wins;
-- Between 1970 – 2016 there were 12 occasions that a team with the most wins also won the world series

SELECT ROUND(100*COUNT(*)::numeric/(SELECT COUNT(DISTINCT yearid) FROM teams WHERE wswin IS NOT NULL), 2)
FROM teams
LEFT JOIN (SELECT
				yearid,
				lgid,
				teamid,
				MAX(W)OVER(PARTITION BY yearid) AS most_wins,
				1 AS counter
			FROM teams) AS mw
USING(yearid, lgid, teamid)		
WHERE yearid BETWEEN 1970 AND 2016
	AND wswin = 'Y'
	AND w = most_wins;
-- Between 1970 – 2016, 10.08% of the time a team with the most wins also won the world series
