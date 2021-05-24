use fichas;
select r.numrec, a.nombre, r.f_pago, r.coment, c.concepto, p.monto
from recibos r join alumnos a on r.id_alumno = a.id
join pagos p on r.numrec = p.rec_id
join conceptos c on p.conc_id = c.id
#where a.nombre like 'COSME MONTERO S%'
#where a.matricula = 190505026
where r.numrec = 55191
#group by r.numrec, a.nombre, r.f_pago, r.coment
#where monto = 1310
#where r.coment like '%4050695%'
order by r.f_pago