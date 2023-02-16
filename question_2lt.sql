--2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?
SELECT namefirst, MIN(height) min_height, count(g_all) AS num_games, name AS team_name  
FROM people AS p 
INNER JOIN Appearances AS a 
USING(playerid)
INNER JOIN teams AS t 
ON a.yearid = t.yearid
GROUP BY namefirst, name
ORDER BY min_height
LIMIT 1;



