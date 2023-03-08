USE leogonmu_mood113;
SET @apellido := '%Briseiday%';
SELECT id, username, lastname, firstname, email, suspended, FROM_UNIXTIME(lastlogin)
#FROM mdl_user
FROM mdlph_user mu 
WHERE lastname LIKE @apellido OR firstname LIKE @apellido OR email LIKE @apellido
#WHERE username LIKE '%200529369%'
ORDER BY lastlogin DESC