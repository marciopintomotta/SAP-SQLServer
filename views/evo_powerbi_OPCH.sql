select  
	'OPCH' cTabela
    , NNM1.[SeriesName] +'/'+ convert(varchar,OPCH.DocNum) [Document Year]
	, OPCH.CardCode [Cod.Sup.]
	, OPCH.CardName [Supplier]
	, OCRD.Country [Country]
	, OPCH.DocTotal - OPCH.VatSum [Liquid]
	, OPCH.VatSum [Vat]
	, OPCH.DocTotal [Total]
	, OPCH.DocCur [Cur]
	,  OPCH.DocEntry
	,  OPCH.DocNum
	, OPCH.DocType
	, OPCH.CANCELED
	, OPCH.DocStatus
	, OPCH.DocDate
	, OPCH.DocDueDate
	
	--, OCRD.* 

from
	dbo.OPCH  with (nolock)  
	inner join dbo.NNM1  with (nolock) ON 
		OPCH.Series = NNM1.Series
		and OPCH.ObjType  = NNM1.ObjectCode
	inner join dbo.OCRD  with (nolock) ON
		OPCH.CardCode = OCRD.CardCode
GO