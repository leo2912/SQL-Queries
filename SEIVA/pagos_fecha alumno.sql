USE fichas;

SELECT DISTINCT c.ciclo, n.nivel, g.grupo, a.matricula, a.nombre, r.numrec, r.f_pago, co.concepto, p.monto 
FROM recibos r JOIN alumnos a ON r.id_alumno = a.id
				JOIN grupos g ON r.id_grupo = g.id
				JOIN niveles n ON r.id_nivel = n.id AND g.nivel_id  = n.id
				JOIN ciclos c ON r.id_ciclo = c.id
				JOIN pagos p ON p.rec_id = r.numrec
				JOIN conceptos co ON p.conc_id = co.id 
WHERE c.ciclo LIKE '2019-2020%' AND a.nombre = 'SIERRA CASTILLO JENNIFER NICOLE'
#GROUP BY c.ciclo, n.nivel, g.grupo, a.matricula, a.nombre
ORDER BY a.nombre;

SELECT r.numrec, r.f_pago, SUM(p.monto) AS total 
            FROM recibos r JOIN alumnos a ON r.id_alumno = a.id
				JOIN ciclos c ON r.id_ciclo = c.id
				JOIN pagos p ON p.rec_id = r.numrec
				JOIN conceptos co ON p.conc_id = co.id 
				 
            WHERE c.ciclo LIKE '2019-2020%'AND nombre = 'SIERRA CASTILLO JENNIFER NICOLE' AND co.concepto NOT LIKE '%/%'  
            GROUP BY r.numrec, r.f_pago
            ORDER BY f_pago