CREATE VIEW [dbo].[evo_powerbi_OVPM] AS
select  
	'OVPM' cTabela
	, NNM1.[SeriesName] +'/'+ convert(varchar,OVPM.DocNum) [Document Year]
	, OVPM.CardCode [Cli.Cod.]
	, OVPM.CardName [Client]
	, OCRD.Country [Country]
	, OVPM.DocTotal - OVPM.VatSum [Liquid]
	, OVPM.VatSum [Vat]
	, OVPM.DocTotal [Total]
	, OVPM.DocCurr [Cur]
	,  OVPM.DocEntry
	,  OVPM.DocNum
	, OVPM.DocType
	, OVPM.CANCELED
	, OVPM.[Status]
	, OVPM.DocDate
	, OVPM.DocDueDate

from
	dbo.OVPM  with (nolock)  
	inner join FOBRIC_PRD.dbo.NNM1  with (nolock) ON  
		OVPM.Series = NNM1.Series
		and OVPM.ObjType  = NNM1.ObjectCode
		and OVPM.CANCELED = 'N'
	inner join FOBRIC_PRD.dbo.OCRD  with (nolock) ON
		OVPM.CardCode = OCRD.CardCode