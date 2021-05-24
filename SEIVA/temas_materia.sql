SELECT mu.id_unidad, mu.nombre_unidad, mt.id_tema, mt.nombre_tema
FROM materias_temas mt  JOIN materias_unidades mu ON mt.id_unidad=mu.id_unidad
		JOIN materias_iva m ON mu.id_materia_iva=m.id_materia_iva
		#JOIN grupos g ON m.id_grupo = g.id_grupo
WHERE m.id_materia_iva = 43 