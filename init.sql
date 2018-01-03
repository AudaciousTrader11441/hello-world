USE [Hotel_Reservation_System]
GO

INSERT INTO [dbo].[Card_details]
           ([card_no]
           ,[name_on_card]
           ,[cvc_no]
           ,[pin]
           ,[account_no]
           ,[exp_date]
           ,[Bank_id]
           ,[card_type])
     VALUES
           (123456
           ,'Kumar C'
           ,123	
           ,1234
           ,123456
           ,'2021-01-01'
           ,'SBI'
           ,'Visa')
GO


USE [Hotel_Reservation_System]
GO

INSERT INTO [dbo].[Bank_details]
           ([Bank_id]
           ,[name])
     VALUES
           ('SBI'
           ,'State Bank of India')
GO


