--- 2.1
SELECT name FROM records WHERE supervisor = "Oliver Warbucks";

--- 2.2
SELECT * FROM records WHERE supervisor = name;

--- 2.3
SELECT name FROM records WHERE salary > 50000 ORDER BY name;

--- 3.1
SELECT day, time 
  FROM records AS a, meetings AS b 
  WHERE a.division = b.division AND supervisor = "Oliver Warbucks";
  
--- 3.2
SELECT a.name, b.name 
  FROM records AS a, records AS b, meetings AS c, meetings AS d
  WHERE a.division = c.division AND b.division = d.division
    AND c.day = d.day AND c.time = d.time AND a.name < b.name;
    
--- 3.3
---Not，因为管理部门的两个人开了两次会议。

--- 3.4
SELECT a.name FROM records AS a, records AS b
  WHERE a.supervisor = b.name AND a.division <> b.division;
  
--- 4.1
SELECT supervisor, sum(salary) FROM records GROUP BY supervisor;

--- 4.2
SELECT day FROM records AS a, meetings AS b
  WHERE a.division = b.division 
  GROUP BY day HAVING count(*) < 5;
  
--- 4.3
SELECT a.division
  FROM records AS a, records AS b
  WHERE a.division = b.division AND a.name <> b.name
  GROUP BY a.division HAVING count(*) > 1 AND max(a.salary + b.salary) < 100000;
  
--- 5.1
--- 15 rows
CREATE TABLE num_taught AS
  SELECT professor, course, count(*) AS times FROM courses
  GROUP BY professor, course ORDER BY course;
 
--- 5.2
SELECT a.professor, b.professor, a.course 
  FROM num_taught AS a, num_taught AS b
  WHERE a.course = b.course AND a.professor < b.professor AND a.times = b.times;

--- 5.3
SELECT a.professor, b.professor 
  FROM courses AS a, courses AS b
  WHERE a.course = b.course AND a.semester = b.semester AND a.professor < b.professor
  GROUP BY a.course, a.semester HAVING count(*) > 1;