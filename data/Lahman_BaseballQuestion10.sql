--Question 10
WITH hr_2016 AS (SELECT LEFT(p.finalgame, 4)::numeric-LEFT(p.debut, 4)::numeric AS career_length,
							p.playerid,
				 			p.namelast,
				 			p.namefirst,
				 			MAX(hr) AS total_hr_2016
				FROM batting AS b
				INNER JOIN people AS p
				ON b.playerid=p.playerid
				WHERE b.yearid = '2016'
					AND LEFT(p.finalgame, 4)::numeric-LEFT(p.debut, 4)::numeric >=10
					AND hr >1
				GROUP BY p.playerid),
career_hr AS (SELECT MAX(hr) AS max_hr,
			  playerid
			 FROM batting
			 GROUP BY playerid)
SELECT h1.career_length,
		h1.playerid,
		h1.total_hr_2016,
		h1.namefirst,
		h1.namelast
FROM hr_2016 AS h1
INNER JOIN career_hr AS h2
USING(playerid)
WHERE (total_hr_2016-max_hr) =0;
