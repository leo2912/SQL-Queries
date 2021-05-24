USE seiva;
SELECT ab.id_alumno AS 'matricula', al.apellido, al.nombre, c.nombre_ciclo AS 'ciclo', con.nombre_concepto AS 'concepto', SUM(cab.cantidad) AS 'cantidad'
FROM cc_abonos ab JOIN alumnos al ON ab.id_alumno = al.id_alumno
	JOIN ciclos c ON ab.id_ciclo = c.id_ciclo
	JOIN cc_cargo_abono cab ON ab.id_abono = cab.id_abono
	JOIN cc_cargos car ON cab.id_cargo = car.id_cargo
	JOIN cc_tarifas tar ON car.id_tarifa = tar.id_tarifa
	JOIN cc_conceptos con ON tar.id_concepto = con.id_concepto
	
	
	
WHERE ab.id_alumno IN ('175512')
GROUP BY cab.id_abono

#GROUP BY ab.id_abono