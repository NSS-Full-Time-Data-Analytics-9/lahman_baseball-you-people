--Question 8
SELECT t.name,
		p.park_name,
		h.attendance/h.games AS average_attendance
FROM homegames AS h
INNER JOIN parks AS p
USING(park)
INNER JOIN teams AS t
USING(attendance)
WHERE year = '2016'
	AND games >='10'
ORDER BY average_attendance DESC
LIMIT 5;
--Highest Average Attendance 2016

SELECT t.name,
		p.park_name,
		h.attendance/h.games AS average_attendance
FROM homegames AS h
INNER JOIN parks AS p
USING(park)
INNER JOIN teams AS t
USING(attendance)
WHERE year = '2016'
	AND games >='10'
ORDER BY average_attendance
LIMIT 5;
--Lowest Average Attendance 2016