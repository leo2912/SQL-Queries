SELECT q.name, q.password
FROM mdl_quiz q
WHERE (from_unixtime(q.timeclose) BETWEEN '2018-11-05 00:00:00' AND '2018-11-06 00:00:00') AND q.course = 3337