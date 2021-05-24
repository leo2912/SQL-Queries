INSERT IGNORE INTO materias_control (id_tema)

	SELECT mt.id_tema
	FROM materias_temas mt JOIN materias_unidades mu ON mt.id_unidad = mu.id_unidad
								JOIN materias_iva miva ON mu.id_materia_iva = miva.id_materia_iva
	WHERE miva.nivel=4
	ORDER BY mt.id_tema
