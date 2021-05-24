SELECT ec.*
FROM examenes_cuestionario ec JOIN examenes_intentos inte ON ec.id_intento = inte.id_intento
										JOIN examenes ex ON inte.id_examen = ex.id_examen
WHERE inte.aciertos > 0 AND ex.id_examen IN (25228) AND ec.puntuacion = 0 AND ec.id_pregunta_historial IN (148409, 148416, 148424, 148428);


#UPDATE `seiva`.`examenes_cuestionario` SET `puntuacion`='1' WHERE  `id_intento`=382905 AND `id_pregunta_historial`=156268;
