-- Before running drop any existing views
DROP VIEW IF EXISTS q0;
DROP VIEW IF EXISTS q1i;
DROP VIEW IF EXISTS q1ii;
DROP VIEW IF EXISTS q1iii;
DROP VIEW IF EXISTS q1iv;
DROP VIEW IF EXISTS q2i;
DROP VIEW IF EXISTS q2ii;
DROP VIEW IF EXISTS q2iii;
DROP VIEW IF EXISTS q3i;
DROP VIEW IF EXISTS q3ii;
DROP VIEW IF EXISTS q3iii;
DROP VIEW IF EXISTS q4i;
DROP VIEW IF EXISTS q4ii;
DROP VIEW IF EXISTS q4iii;
DROP VIEW IF EXISTS q4iv;
DROP VIEW IF EXISTS q4v;

-- Question 0
CREATE VIEW q0(era)
AS
  --SELECT 1 -- replace this line
  SELECT 
    MAX(era)
  FROM 
    pitching
;

-- Question 1i
CREATE VIEW q1i(namefirst, namelast, birthyear)
AS
  --SELECT 1, 1, 1 -- replace this line
  SELECT 
    namefirst,
    namelast,
    birthyear
  FROM
    people
  WHERE
    weight > 300
;

-- Question 1ii
CREATE VIEW q1ii(namefirst, namelast, birthyear)
AS
  --SELECT 1, 1, 1 -- replace this line
  SELECT
    namefirst,
    namelast,
    birthyear
  FROM
    people
  WHERE
    namefirst LIKE '% %'
  ORDER BY
    namefirst, namelast
;

-- Question 1iii
CREATE VIEW q1iii(birthyear, avgheight, count)
AS
  --SELECT 1, 1, 1 -- replace this line
  SELECT
    birthyear,
    AVG(height),
    COUNT(playerID)
  FROM
    people
  GROUP BY
    birthyear
  HAVING
    COUNT(playerID) > 0
  ORDER BY
    birthyear
;

-- Question 1iv
CREATE VIEW q1iv(birthyear, avgheight, count)
AS
  --SELECT 1, 1, 1 -- replace this line
  SELECT *
  FROM
    q1iii
  WHERE
    avgheight > 70
;

-- Question 2i
CREATE VIEW q2i(namefirst, namelast, playerid, yearid)
AS
  --SELECT 1, 1, 1, 1 -- replace this line
  SELECT
    people.namefirst,
    people.namelast,
    people.playerid,
    halloffame.yearid
  FROM
    people INNER JOIN halloffame
    ON people.playerid = halloffame.playerid
    AND halloffame.inducted = 'Y'
  ORDER BY
    halloffame.yearid DESC,
    people.playerid
;

-- Question 2ii
CREATE VIEW q2ii(namefirst, namelast, playerid, schoolid, yearid)
AS
  --SELECT 1, 1, 1, 1, 1 -- replace this line
  SELECT
    q2i.namefirst,
    q2i.namelast,
    q2i.playerid,
    schools.schoolid,
    q2i.yearid
  FROM
    schools INNER JOIN (
      q2i INNER JOIN collegeplaying
      ON q2i.playerid = collegeplaying.playerid
    )
    ON schools.schoolid = collegeplaying.schoolid
  WHERE
    schools.schoolstate = 'CA'
  ORDER BY
    q2i.yearid DESC,
    schools.schoolid,
    q2i.playerid
;

-- Question 2iii
CREATE VIEW q2iii(playerid, namefirst, namelast, schoolid)
AS
  --SELECT 1, 1, 1, 1 -- replace this line
  SELECT
    q2i.playerid,
    q2i.namefirst,
    q2i.namelast,
    collegeplaying.schoolid
  FROM
    q2i LEFT JOIN collegeplaying
    ON q2i.playerid = collegeplaying.playerid
  ORDER BY
    q2i.playerid DESC,
    collegeplaying.schoolid   
;

-- Question 3i
CREATE VIEW q3i(playerid, namefirst, namelast, yearid, slg)
AS
  SELECT 1, 1, 1, 1, 1 -- replace this line
;

-- Question 3ii
CREATE VIEW q3ii(playerid, namefirst, namelast, lslg)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 3iii
CREATE VIEW q3iii(namefirst, namelast, lslg)
AS
  SELECT 1, 1, 1 -- replace this line
;

-- Question 4i
CREATE VIEW q4i(yearid, min, max, avg)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 4ii
CREATE VIEW q4ii(binid, low, high, count)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 4iii
CREATE VIEW q4iii(yearid, mindiff, maxdiff, avgdiff)
AS
  SELECT 1, 1, 1, 1 -- replace this line
;

-- Question 4iv
CREATE VIEW q4iv(playerid, namefirst, namelast, salary, yearid)
AS
  SELECT 1, 1, 1, 1, 1 -- replace this line
;
-- Question 4v
CREATE VIEW q4v(team, diffAvg) AS
  SELECT 1, 1 -- replace this line
;

