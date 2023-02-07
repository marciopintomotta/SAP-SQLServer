select
	DATEDIFF(DD,POR.ShipDate,getdate()) idelayedDays
	, convert(decimal(18,2),(POR.OpenQty / POR.Quantity) * 100 ) dPendingPer
	,OPOR.CardCode vcSupplier 
	,OPOR.CardName vcSupplierName 
	, OCPR.Name vcSupplierContactName
	,  OCPR.E_MailL vcSupplierEmailContact 
	--,NNM1.[SeriesName]
	,NNM1.[SeriesName] +'/'+ convert(varchar,OPOR.DocNum) [vcDocmentSeriesName]
	, OPOR.CANCELED
	, OPOR.DocDate
	, OPOR.DocDueDate
	, POR.ShipDate
	,POR.ItemCode
	,POR.Dscription
	,POR.Quantity
	,POR.OpenQty
	,POR.Quantity - isnull(POR.OpenQty,0) dReceived
    , OPOR.DocNum
	, POR.unitMsr
	, POR.* 
from 
	POR1 POR with (nolock)
	inner join OPOR OPOR with (nolock) on 
		POR.BaseCard = 'FOCO0063'
		and POR.DocEntry = OPOR.DocEntry
	inner join OCRD OCRD with (nolock) on
		OPOR.CardCode = OCRD.CardCode
	inner join dbo.NNM1 NNM1 with (nolock) ON 
		OPOR.Series = NNM1.Series
		and OPOR.ObjType  = NNM1.ObjectCode
	outer apply (
	
		select 
			top (1)
			OCPR.Name
			, OCPR.E_MailL
		from 
			dbo.OCPR OCPR with (nolock)
		where 
			OPOR.CardCode = OCPR.CardCode
			and OCPR.E_MailL is not null 

	
	) OCPR
where 
	OpenQty > 0 
	--and ShipDate < getdate()
	and DATEDIFF(DD,POR.ShipDate,DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0)) > 0 
	and OPOR.CANCELED = 'N'
order by 
	DATEDIFF(DD,POR.ShipDate,DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0)) desc