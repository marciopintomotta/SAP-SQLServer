declare
	@SubCatNum varchar(50) = '4100275'
	, @CardCode varchar(15) = null -- 'CLAU0045'

select
	
	RDR1.SubCatNum ClientItemCode
	,ORDR.NumAtCard ClientExternalOrder
	,ORDR.DocEntry
	,NNM1.[SeriesName] +'/'+ convert(varchar,ORDR.DocNum) [DocumentSeriesName]
	,RDR1.ItemCode
	,RDR1.Dscription
	,ORDR.CardCode
	,ORDR.CardName
	,ORDR.DocNum
	,ORDR.DocStatus
	, ORDR.updateDate
	, ORDR.CreateDate
	, ORDR.DataSource
	, ORDR.DataVers
from (
	select
		RDR1.DocEntry
		, max(RDR1.SubCatNum) SubCatNum
		, max(RDR1.ItemCode) ItemCode
		, max(RDR1.Dscription) Dscription
	from 
		dbo.RDR1 with (nolock)
	where
		(@CardCode is null or RDR1.BaseCard = @CardCode)
		and RDR1.SubCatNum = @SubCatNum
		and RDR1.LineStatus = 'O'
	group by
		RDR1.DocEntry
 )RDR1
  inner join dbo.ORDR with (nolock) on
	RDR1.DocEntry = ORDR.DocEntry
	and ORDR.DocStatus = 'O'
  inner join dbo.NNM1 NNM1 with (nolock) ON 
		ORDR.Series = NNM1.Series
		and ORDR.ObjType  = NNM1.ObjectCode