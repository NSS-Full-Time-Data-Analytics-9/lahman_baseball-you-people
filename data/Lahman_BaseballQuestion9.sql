--Question 9
SELECT p.namefirst, p.namelast, a.yearid, t.name
FROM managers AS m
INNER JOIN people AS p
USING (playerid)
INNER JOIN awardsmanagers AS a
ON m.playerid=a.playerid
	AND m.yearid=a.yearid
INNER JOIN teams AS t
ON m.yearid=t.yearid
	AND m.teamid=t.teamid
WHERE a.playerid IN (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid = 'TSN Manager of the Year'
				  		AND lgid = 'NL')
	AND a.playerid IN (SELECT playerid
				  FROM awardsmanagers
				  WHERE awardid = 'TSN Manager of the Year'
				  		AND lgid = 'AL')	
GROUP BY a.yearid ,p.namefirst, p.namelast,t.name;
				
