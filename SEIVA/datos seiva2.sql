SELECT s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, 
		ine.id_alumno, a.apellido, a.nombre, acu.curp, ad.lugar_nacimiento, ad.escuela_procedencia, ad.problemas_salud, adir.calle, adir.colonia, ac.telefono_1, ac.telefono_2, ac.email

FROM seivas s 
				JOIN escuelas e ON s.id_escuela = e.id_escuela
				JOIN inscripcion_escuela ine ON e.id_escuela = ine.id_escuela
                JOIN inscripcion_grupo ing ON ine.id_alumno = ing.id_alumno
                JOIN grupos g on ing.id_grupo = g.id_grupo 
                LEFT JOIN alumnos a on ing.id_alumno = a.id_alumno
                LEFT JOIN alumnos_curps acu ON a.id_alumno = acu.id_alumno
                LEFT JOIN alumnos_datos ad ON a.id_alumno = ad.id_alumno
			    LEFT JOIN alumnos_direccion adir ON a.id_alumno = adir.id_alumno
               #LEFT JOIN alumnos_padres ap ON adir.id_alumno = ap.id_alumno 
                LEFT JOIN alumnos_contacto ac ON a.id_alumno = ac.id_alumno

                               
WHERE s.id_ciclo = ine.id_ciclo 
	AND s.id_seiva = g.id_seiva
	AND s.id_ciclo = 9
    #AND grado = 6
    #AND nombre_escuela = "PRIMARIA CENTRO"
ORDER BY e.nombre_escuela, g.nombre_grupo, a.apellido, a.nombre