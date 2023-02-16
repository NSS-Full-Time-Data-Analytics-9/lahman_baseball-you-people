--Question 9

SELECT namefirst, namelast, teamid, m.yearid
FROM people AS p
INNER JOIN managers AS m
USING(playerid)
INNER JOIN awardsmanagers AS a
ON m.yearid=a.yearid
	AND m.playerid=a.playerid
WHERE a.playerid IN (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid = 'TSN Manager of the Year'
				  AND lgid= 'NL')
	AND a.playerid IN (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid = 'TSN Manager of the Year'
				  AND lgid= 'AL')
	AND m.teamid IN (SELECT DISTINCT teamid
					FROM managers AS m
					 INNER JOIN awardsmanagers AS a
					 USING(playerid)
					WHERE awardid = 'TSN Manager of the Year'
				  AND a.lgid= 'NL')
	AND m.teamid IN (SELECT DISTINCT teamid
					FROM managers AS m
					 INNER JOIN awardsmanagers AS a
					 USING(playerid)
					WHERE awardid = 'TSN Manager of the Year'
				  AND a.lgid= 'AL')
GROUP BY m.yearid, namefirst, namelast, teamid;
	 











	

			




	
