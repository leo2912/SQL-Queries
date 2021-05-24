SELECT uni.nombre_unidad, tm.id_tema, tm.tema, tm.nombre_tema, MAX(bp.fecha_creacion)
FROM materias_unidades uni JOIN materias_temas tm ON uni.id_unidad = tm.id_unidad
									JOIN banco_preguntas bp on tm.id_tema = bp.id_tema
WHERE uni.id_materia_iva = 45
GROUP BY tm.id_tema