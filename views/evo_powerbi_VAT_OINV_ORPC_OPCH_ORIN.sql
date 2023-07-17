CREATE VIEW [dbo].[evo_powerbi_VAT_OINV_ORPC_OPCH_ORIN] AS 

SELECT TOP (1000) [cTabela]
      ,[Document Year]
      ,[Cli.Cod.] [Cli.Ent.]
      ,[Client] [Entity]
      ,[Country]
      ,[Liquid]
      ,[Vat]  * -1 [Vat]
      ,[Total]
      ,[Cur]
      ,[DocDate]
      ,[DocDueDate]
  FROM [dbo].[evo_powerbi_OINV]
  where vat > 0 

union select 
	[cTabela]
      ,[Document Year]
      ,[Cli.Sup.]
      ,[Entity]
      ,[Country]
      ,[Liquid]
      ,[Vat]  * -1
      ,[Total]
      ,[Cur]
      ,[DocDate]
      ,[DocDueDate]
  FROM [FOBRIC_PRD].[dbo].[evo_powerbi_ORPC]
 where vat > 0 


 union select 
 
	[tabela]
      ,[Document Year]
      ,[Cod.Sup.]
      ,[Supplier]
      ,[Country]
      ,[Liquid]
      ,[Vat]
      ,[Total]
      ,[Cur]
      ,[DocDate]
      ,[DocDueDate]
 
 from dbo.evo_powerbi_OPCH
 where vat > 0 

 union SELECT TOP (1000) [cTabela]
      ,[Document Year]
      ,[Cli.Cod.]
      ,[Entity]
      ,[Country]
      ,[Liquid]
      ,[Vat]
      ,[Total]
      ,[Cur]
      ,[DocDate]
      ,[DocDueDate]
  FROM [FOBRIC_PRD].[dbo].evo_powerbi_ORIN
  where vat > 0 