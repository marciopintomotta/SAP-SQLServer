CREATE VIEW [dbo].[evo_powerbi_ORCT] AS
select  
	'ORCT' cTabela
	, NNM1.[SeriesName] +'/'+ convert(varchar,ORCT.DocNum) [Document Year]
	, ORCT.CardCode [Cli.Cod.]
	, ORCT.CardName [Client]
	, OCRD.Country [Country]
	, ORCT.DocTotal - ORCT.VatSum [Liquid]
	, ORCT.VatSum [Vat]
	, ORCT.DocTotal [Total]
	, ORCT.DocCurr [Cur]
	,  ORCT.DocEntry
	,  ORCT.DocNum
	, ORCT.DocType
	, ORCT.CANCELED
	, ORCT.[Status]
	, ORCT.DocDate
	, ORCT.DocDueDate

from
	dbo.ORCT  with (nolock)  
	inner join FOBRIC_PRD.dbo.NNM1  with (nolock) ON  
		ORCT.Series = NNM1.Series
		and ORCT.ObjType  = NNM1.ObjectCode
		and ORCT.CANCELED = 'N'
	inner join FOBRIC_PRD.dbo.OCRD  with (nolock) ON
		ORCT.CardCode = OCRD.CardCode