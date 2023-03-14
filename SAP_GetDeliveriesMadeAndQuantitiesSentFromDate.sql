
declare
	@AnalysisData date =  dateadd(YY, -1, getdate())

select
	x.ItemCode
	, count(*) Deliveries
	, sum(x.Quantity) QuantityDelivered
	, max(x.DocDateLast) LastDelivery
from (
	select
		ODLN.DocEntry
		, DLN1.ItemCode
		, sum(DLN1.Quantity) Quantity
		, max(DocDate) DocDateLast
	 from (
		select 
			ODLN.DocEntry 
		 from 
			dbo.ODLN with (nolock)
		 where
			DocDate > @AnalysisData
	 ) ODLN
	 inner join dbo.DLN1 with (nolock) on
		ODLN.DocEntry  = DLN1.DocEntry
	 group by
		ODLN.DocEntry
		, DLN1.ItemCode
	) x
group by
	x.ItemCode
order by
	2 desc