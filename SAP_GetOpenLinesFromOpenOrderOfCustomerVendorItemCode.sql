declare
	@SubCatNum varchar(50) = '4100275'
	, @CardCode varchar(15) = null -- 'CLAU0045'


select
	
	RDR1.SubCatNum ClientItemCode
	,ORDR.NumAtCard ClientExternalOrder
	,ORDR.DocEntry
	,NNM1.[SeriesName] +'/'+ convert(varchar,ORDR.DocNum) [DocSeriesName]
	
	,ORDR.CardCode
	,ORDR.CardName
	,ORDR.DocNum
	
	
	,RDR1.ItemCode
	,RDR1.Dscription
	
	, RDR1.LineNum
	, RDR1.Quantity
	, RDR1.ShipDate
	, RDR1.OpenQty
	, RDR1.Price


	
from (
	select
	top(1)
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
	order by
		RDR1.DocEntry
 )x
  inner join dbo.ORDR with (nolock) on
	x.DocEntry = ORDR.DocEntry
	and ORDR.DocStatus = 'O'
  inner join dbo.NNM1 NNM1 with (nolock) ON 
		ORDR.Series = NNM1.Series
		and ORDR.ObjType  = NNM1.ObjectCode
  inner join dbo.RDR1 with (nolock) on
	RDR1.DocEntry = ORDR.DocEntry
	and RDR1.LineStatus = 'O'
