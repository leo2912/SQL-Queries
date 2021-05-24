SELECT esc.nombre_escuela, tar.id_tarifa, cc.nombre_concepto, tar.cantidad, tar.fecha_cobro
FROM cc_tarifas tar JOIN escuelas esc ON tar.id_escuela = esc.id_escuela JOIN cc_conceptos cc ON tar.id_concepto = cc.id_concepto
		
WHERE tar.id_ciclo = 10 and nombre_concepto = 'Colegiatura Diciembre'