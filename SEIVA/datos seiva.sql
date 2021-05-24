SELECT ins.id_escuela, s.nombre_seiva, a.id_alumno, a.apellido, a.nombre, ad.lugar_nacimiento, ad.escuela_procedencia, ad.problemas_salud, adir.calle, adir.colonia, ac.telefono_1, ac.telefono_2, ac.email
FROM alumnos a JOIN alumnos_datos ad ON a.id_alumno = ad.id_alumno
			   JOIN alumnos_direccion adir ON ad.id_alumno = adir.id_alumno
               #JOIN alumnos_padres ap ON adir.id_alumno = ap.id_alumno 
               JOIN alumnos_contacto ac ON ad.id_alumno = ac.id_alumno
               JOIN inscripcion_escuela ins ON ac.id_alumno = ins.id_alumno
               JOIN seivas s ON ins.id_escuela = s.id_escuela
               
               #JOIN inscripcion_grupo ing ON ins.id_alumno = ing.id_alumno
WHERE a.apellido != "S/N" AND ins.id_ciclo = 9
LIMIT 0,20;

