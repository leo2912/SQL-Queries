use fichas;
select DATE_FORMAT(r.f_pago , '%m-%Y'), c.ciclo, n.nivel, g.grupo, round(sum(p.monto),2), count(distinct r.id_alumno)
from niveles n join recibos r on n.id = r.id_nivel
join grupos g on g.id = r.id_grupo
join ciclos c on c.id = r.id_ciclo 
join pagos p on r.numrec = p.rec_id 
where r.t_recib = 'normal' and n.nivel not like '%*%' and n.nivel not like 'ND' and c.id = 69
GROUP BY MONTH(r.f_pago), YEAR(r.f_pago), c.ciclo, n.nivel, g.grupo
order by YEAR(r.f_pago),  MONTH(r.f_pago), n.nivel, g.grupo
