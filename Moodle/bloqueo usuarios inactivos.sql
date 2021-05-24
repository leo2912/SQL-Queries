USE moodleiva;
-- SELECT username, lastname, suspended, lastlogin, from_unixtime(lastlogin) as login
-- FROM mdl_user
-- WHERE suspended = 1 AND lastlogin > 0 AND from_unixtime(lastlogin) > '2018-11-09'
-- ORDER BY login DESC;

#UPDATE mdl_user SET suspended = 1
#WHERE lastlogin > 0 AND from_unixtime(lastlogin) < '2018-11-09';

SELECT count(*)
FROM mdl_user
WHERE suspended = 1 AND lastlogin > 0 AND from_unixtime(lastlogin) > '2018-11-09'
