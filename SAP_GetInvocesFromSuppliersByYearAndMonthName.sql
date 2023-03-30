select  
	NNM1.[SeriesName] +'/'+ convert(varchar,OPCH.DocNum) [DocumentSeriesName]
	, OPCH.CardCode
	, OPCH.CardName
	, OCRD.Country
	, OPCH.DocTotal - OPCH.VatSum DocLiquid
	,OPCH.VatSum
	,OPCH.DocTotal
	, OPCH.DocCur
	,  OPCH.DocEntry
	,  OPCH.DocNum
	, OPCH.DocType
	, OPCH.CANCELED
	, OPCH.DocStatus
	, OPCH.DocDate
	, OPCH.DocDueDate
	, year(OPCH.DocDate) iYear
	, MONTH(OPCH.DocDate) iMonthNumber
	, FORMAT(OPCH.DocDate, 'MMMM', 'pt') vcMonthName
	,right('0' + convert(varchar,MONTH(OPCH.DocDate)),2) + ' - ' + FORMAT(OPCH.DocDate, 'MMMM', 'pt') vcMonthNumberName
	
	--, OCRD.* 
from
	dbo.OPCH  with (nolock)  
	inner join dbo.NNM1  with (nolock) ON 
		OPCH.Series = NNM1.Series
		and OPCH.ObjType  = NNM1.ObjectCode
	inner join dbo.OCRD  with (nolock) ON
		OPCH.CardCode = OCRD.CardCode