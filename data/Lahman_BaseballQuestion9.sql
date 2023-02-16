--Question 9
SELECT p.namefirst, p.namelast, a.yearid, m.teamid
FROM managers AS m
INNER JOIN people AS p
USING (playerid)
INNER JOIN awardsmanagers AS a
ON m.playerid=a.playerid
	AND m.yearid=a.yearid
WHERE a.playerid IN (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid = 'TSN Manager of the Year'
				  		AND lgid = 'NL')
	AND a.playerid IN (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid = 'TSN Manager of the Year'
				  		AND lgid = 'AL')
	AND m.teamid IN (SELECT m.teamid
				  FROM managers AS m
				  INNER JOIN awardsmanagers AS a
				  ON m.playerid=a.playerid
				  WHERE awardid = 'TSN Manager of the Year'
				  		AND a.lgid = 'NL')
	AND m.teamid IN (SELECT m.teamid 
				  FROM managers AS m
				  INNER JOIN awardsmanagers AS a
				  ON m.playerid=a.playerid
				  WHERE awardid = 'TSN Manager of the Year'
				  	AND a.lgid = 'AL')
GROUP BY a.yearid ,p.namefirst, p.namelast,m.teamid;
				
