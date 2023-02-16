--Question 2

SELECT  MIN(p.height),
		p.namefirst,
		p.namelast,
		a.g_all,
		t.name
FROM people AS p
INNER JOIN appearances AS a
USING(playerid)
INNER JOIN teams AS t
USING (teamid)
WHERE t.teamid = 'SLA'
GROUP BY p.namefirst, p.namelast, a.g_all, t.name
ORDER BY MIN(p.height)
LIMIT 1;



