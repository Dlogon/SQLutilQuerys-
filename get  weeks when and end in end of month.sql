	  set datefirst 1
declare @idRestaurante int 
declare @fechainicial datetime
declare @fechafinal datetime
set @idRestaurante =6
set @fechainicial ='20161001'
set @fechafinal ='20161031'
	  select 

	'Al ' + 
	cast(day(fecha) as varchar)
     +  ' de ' + datename(month,(fecha)) + ' de ' + cast(year(fecha) as varchar) PlanDel1al,
	'SEMANA ' + cast(datepart(week,fecha) - datepart(week, dateadd(dd,-day(fecha)+1,fecha)) +1 as varchar) semana 

	from operacion 
		where fecha between @fechaInicial and @fechaFinal
	and idrestaurante = @idRestaurante and DATEPART(dw,fecha) IN (
	case
      when day(DATEADD(day,1,Fecha)) = 1
      then datepart(dw,fecha)
      else 7
    end 
	)

	order by fecha