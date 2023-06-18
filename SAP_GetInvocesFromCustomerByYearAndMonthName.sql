select  
	NNM1.[SeriesName] +'/'+ convert(varchar,OINV.DocNum) [Document Year]
	, OINV.CardCode [Cli.Cod.]
	, OINV.CardName [Client]
	, OCRD.Country
	, OINV.DocTotal - OINV.VatSum  [Liquid]
	,OINV.VatSum [Vat]
	,OINV.DocTotal [Total]
	, OINV.DocCur [Cur]
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
	,  FORMAT(OINV.DocDate, 'dd-MM-yyyy', 'pt') [Doc. Date]
	,  FORMAT(OINV.DocDueDate, 'dd-MM-yyyy', 'pt') [Due Date]
	
	--, OCRD.* 
from
	dbo.OINV  with (nolock)  
	inner join dbo.NNM1  with (nolock) ON 
		OINV.Series = NNM1.Series
		and OINV.ObjType  = NNM1.ObjectCode
		and OINV.CANCELED = 'N'
	inner join dbo.OCRD  with (nolock) ON
		OINV.CardCode = OCRD.CardCode
order by OINV.DocDate