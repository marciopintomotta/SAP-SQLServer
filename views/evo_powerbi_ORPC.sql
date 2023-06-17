select  
	'ORIN' cTabela
	, NNM1.[SeriesName] +'/'+ convert(varchar,ORIN.DocNum) [Document Year]
	, ORIN.CardCode [Cli.Cod.]
	, ORIN.CardName [Client]
	, OCRD.Country [Country]
	, ORIN.DocTotal - ORIN.VatSum [Liquid]
	, ORIN.VatSum [Vat]
	, ORIN.DocTotal [Total]
	, ORIN.DocCur [Cur]
	,  ORIN.DocEntry
	,  ORIN.DocNum
	, ORIN.DocType
	, ORIN.CANCELED
	, ORIN.DocStatus
	, ORIN.DocDate
	, ORIN.DocDueDate

from
	dbo.ORIN  with (nolock)  
	inner join dbo.NNM1  with (nolock) ON  
		ORIN.Series = NNM1.Series
		and ORIN.ObjType  = NNM1.ObjectCode
		and ORIN.CANCELED = 'N'
	inner join dbo.OCRD  with (nolock) ON
		ORIN.CardCode = OCRD.CardCode
GO