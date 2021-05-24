USE moodleiva;

UPDATE mdl_user
SET suspended = 1
WHERE username LIKE 'a2001%' OR username LIKE 'a2002%' OR username LIKE 'a2003%' OR username LIKE 'a2004%'