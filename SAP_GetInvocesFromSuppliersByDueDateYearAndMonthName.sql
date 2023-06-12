select  
	NNM1.[SeriesName] +'/'+ convert(varchar,OPCH.DocNum) [Document Year]
	, OPCH.CardCode [Cod.Sup.]
	, OPCH.CardName [Supplier]
	, OCRD.Country [Country]
	, OPCH.DocTotal - OPCH.VatSum [Liquid]
	,OPCH.VatSum [Vat]
	,OPCH.DocTotal [Total]
	, OPCH.DocCur [Cur]
	,  OPCH.DocEntry
	,  OPCH.DocNum
	, OPCH.DocType
	, OPCH.CANCELED
	, OPCH.DocStatus
	, OPCH.DocDate
	, OPCH.DocDueDate
	, year(OPCH.DocDueDate) iYear
	, MONTH(OPCH.DocDueDate) iMonthNumber
	, FORMAT(OPCH.DocDueDate, 'MMMM', 'pt') vcMonthName
	,right('0' + convert(varchar,MONTH(OPCH.DocDueDate)),2) + ' - ' + FORMAT(OPCH.DocDueDate, 'MMMM', 'pt') vcMonthNumberName
	,  FORMAT(OPCH.DocDate, 'dd-MM-yyyy', 'pt') [Doc. Date]
	,  FORMAT(OPCH.DocDueDate, 'dd-MM-yyyy', 'pt') [Due Date]
	
	--, OCRD.* 

from
	dbo.OPCH  with (nolock)  
	inner join dbo.NNM1  with (nolock) ON 
		OPCH.Series = NNM1.Series
		and OPCH.ObjType  = NNM1.ObjectCode
	inner join dbo.OCRD  with (nolock) ON
		OPCH.CardCode = OCRD.CardCode