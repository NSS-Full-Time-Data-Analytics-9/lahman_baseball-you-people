--6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.

SELECT playerid, sb, (sb::numeric * 100  / (select SUM(sb::numeric) from batting WHERE yearid = 2016)) AS percent
FROM batting
WHERE yearid = 2016
  AND sb >= 20
GROUP BY playerid, sb
ORDER BY sb DESC;

