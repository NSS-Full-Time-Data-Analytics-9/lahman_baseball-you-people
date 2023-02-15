-- Question 2
-- Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

-- Find: name (first + last), height, no. of games played, team name for shortest player
-- Using: people, appearances, teams

SELECT
	p.namefirst AS first_name,
	p.namelast AS last_name,
	p.height,
	a.G_all AS no_of_games_played,
	t.name AS team_name
FROM people AS p
	LEFT JOIN appearances AS a
	USING(playerid)
	LEFT JOIN teams AS t
	USING(teamid, yearid)
WHERE height = (SELECT MIN(height) FROM people)