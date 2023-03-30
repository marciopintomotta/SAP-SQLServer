select  
	NNM1.[SeriesName] +'/'+ convert(varchar,OINV.DocNum) [DocumentSeriesName]
	, OINV.CardCode
	, OINV.CardName
	, OCRD.Country
	, OINV.DocTotal - OINV.VatSum DocLiquid
	,OINV.VatSum
	,OINV.DocTotal
	, OINV.DocCur
	,  OINV.DocEntry
	,  OINV.DocNum
	, OINV.DocType
	, OINV.CANCELED
	, OINV.DocStatus
	, OINV.DocDate
	, OINV.DocDueDate
	, year(OINV.DocDate) iYear
	, MONTH(OINV.DocDate) iMonthNumber
	, FORMAT(OINV.DocDate, 'MMMM', 'pt') vcMonthName
	,right('0' + convert(varchar,MONTH(OINV.DocDate)),2) + ' - ' + FORMAT(OINV.DocDate, 'MMMM', 'pt') vcMonthNumberName
	
	--, OCRD.* 
from
	dbo.OINV  with (nolock)  
	inner join dbo.NNM1  with (nolock) ON 
		OINV.Series = NNM1.Series
		and OINV.ObjType  = NNM1.ObjectCode
	inner join dbo.OCRD  with (nolock) ON
		OINV.CardCode = OCRD.CardCode