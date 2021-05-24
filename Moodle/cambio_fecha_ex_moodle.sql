UPDATE mdl_quiz q SET q.timeclose = 1557774000
WHERE q.course IN (3611, 3550) and q.name LIKE 'PreExtra%'
