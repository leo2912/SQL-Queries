USE moodleiva;
#USE leogonmu_mood113;
SET @apellido := 'Flores A%';
SELECT id, username, lastname, firstname, email, suspended, FROM_UNIXTIME(lastlogin), FROM_UNIXTIME(firstaccess)
FROM mdl_user
#FROM mdlph_user mu 
WHERE lastname LIKE @apellido OR firstname LIKE @apellido OR email LIKE @apellido
#WHERE username LIKE '%200529369%'
#WHERE suspended = 1
ORDER BY lastlogin DESC

