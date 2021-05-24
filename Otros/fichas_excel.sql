use fichas;
select r.numrec, ci.ciclo, n.nivel, g.grupo, a.nombre, r.f_pago, r.coment, c.concepto, p.monto
from recibos r join alumnos a on r.id_alumno = a.id
join pagos p on r.numrec = p.rec_id
join conceptos c on p.conc_id = c.id
join ciclos ci on r.id_ciclo = ci.id
join niveles n on r.id_nivel = n.id 
join grupos g on r.id_grupo = g.id and n.id = g.nivel_id
#where a.nombre = 'Arias Lunar Román'
where ci.id = 96 and n.nivel = 'Secundaria Buenavista'
order by g.grupo, a.nombre, r.f_pago;

select r.numrec, ci.ciclo, n.nivel, g.grupo, a.nombre, r.f_pago, r.coment, SUM(p.monto)
                            from recibos r join alumnos a on r.id_alumno = a.id
                            join pagos p on r.numrec = p.rec_id
                            
                            join ciclos ci on r.id_ciclo = ci.id
                            join niveles n on r.id_nivel = n.id 
                            join grupos g on r.id_grupo = g.id and n.id = g.nivel_id 
                            where a.nombre = 'Arias Lunar Román'
                            group by r.numrec, ci.ciclo, n.nivel, g.grupo, a.nombre, r.f_pago, r.coment
                            order by g.grupo, a.nombre, r.f_pago;

select distinct ci.ciclo, n.nivel, g.grupo
FROM recibos r join alumnos a on r.id_alumno = a.id
							join ciclos ci on r.id_ciclo = ci.id
                            join niveles n on r.id_nivel = n.id 
                            join grupos g on r.id_grupo = g.id and n.id = g.nivel_id 
where a.nombre = 'Arias Lunar Román' 