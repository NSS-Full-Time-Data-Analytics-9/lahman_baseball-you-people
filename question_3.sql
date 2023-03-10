-- Question 3
-- Find all players in the database who played at Vanderbilt University. 
-- Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
-- Sort this list in descending order by the total salary earned. 
-- Which Vanderbilt player earned the most money in the majors?

-- Find: all vanderbilt players, first name, last name, sum of salary, order by sum of salary desc, which vandy player earned the most in the majors
-- Given: collegeplaying, people, salaries, schools

SELECT 
	p.namefirst AS first_name,
	p.namelast AS last_name,
	SUM(sa.salary::numeric::money) AS total_salary
FROM people AS p
	LEFT JOIN collegeplaying AS cp
	USING(playerid)
	LEFT JOIN salaries AS sa
	USING(playerid)
	LEFT JOIN schools AS sc
	USING(schoolid)
WHERE sc.schoolname = 'Vanderbilt University'
GROUP BY p.namefirst, p.namelast
ORDER BY total_salary DESC NULLS LAST;

-- David Price is the Vanderbilt player that earned the most money in the majors

