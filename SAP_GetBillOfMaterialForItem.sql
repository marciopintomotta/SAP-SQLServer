declare @Item varchar(50) = 'CSPO0026'

select
	ORST.AbsEntry
	, ORST.Code
	, ORST.[Desc]
	, case when ITT1.[Type] = 290 then 'Resource'
		when ITT1.[Type] = 4 then 'Item' end vcType
	, ITT1.code
	, ITT1.ItemName
	, ITT1.Quantity
	, ITT1.AddQuantit
	, ITT1.Warehouse
	, case when ITT1.IssueMthd = 'B' then 'Backflush'
		when ITT1.IssueMthd = 'M' then 'Manual' end vcType
	, ITT1.Price
	, ITT1.Currency
	, ORST.UserSign
	, ORST.UserSign2
	, ORST.LogInstanc


from 
	dbo.ITT2 
	inner join dbo.ORST with (nolock) on 
		ITT2.StgEntry = ORST.AbsEntry
		and ITT2.father = @Item
	outer apply (
		select
			ITT1.*
		from 
			dbo.ITT1 with (nolock) 
		where
			ITT2.Father =  ITT1.Father  
			and ITT2.StageId = ITT1.StageId

	)ITT1 
order by
	ITT2.SeqNum
	, ITT1.VisOrder