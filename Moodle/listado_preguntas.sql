SELECT cat.name, q.questiontext
FROM mdl_question q JOIN mdl_question_categories cat ON q.category = cat.id
WHERE cat.parent = 9104 AND q.questiontext != '0'
