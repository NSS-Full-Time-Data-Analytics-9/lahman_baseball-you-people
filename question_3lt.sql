--3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
SELECT namefirst, namelast, schoolname, SUM(salary) AS total_salary
FROM people AS p
CROSS JOIN schools AS s 
INNER JOIN salaries AS s1
USING(playerid) 
WHERE schoolname = 'Vanderbilt University'
GROUP BY namefirst, namelast, schoolname
ORDER BY total_salary DESC;
-- Alex Rodriguez earned the most money 

