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
	FOBRIC_PRD.dbo.OPCH  with (nolock)  
	inner join FOBRIC_PRD.dbo.NNM1  with (nolock) ON 
		OPCH.DocDueDate >= DATEADD(s, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE())+1, 0)) 
		and OPCH.Series = NNM1.Series
		and OPCH.ObjType  = NNM1.ObjectCode
	inner join FOBRIC_PRD.dbo.OCRD  with (nolock) ON
		OPCH.CardCode = OCRD.CardCode
GO