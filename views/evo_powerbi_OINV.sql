select  
	'OINV' cTabela
	, NNM1.[SeriesName] +'/'+ convert(varchar,OINV.DocNum) [Document Year]
	, OINV.CardCode [Cli.Cod.]
	, OINV.CardName [Client]
	, OCRD.Country [Country]
	, OINV.DocTotal - OINV.VatSum [Liquid]
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

from
	FOBRIC_PRD.dbo.OINV  with (nolock)  
	inner join FOBRIC_PRD.dbo.NNM1  with (nolock) ON  
		OINV.Series = NNM1.Series
		and OINV.ObjType  = NNM1.ObjectCode
		and OINV.CANCELED = 'N'
	inner join FOBRIC_PRD.dbo.OCRD  with (nolock) ON
		OINV.CardCode = OCRD.CardCode



