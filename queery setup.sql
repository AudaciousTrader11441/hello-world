USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[InRoom]    Script Date: 12/7/2017 9:39:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[InRoom]
@hotel_id varchar(7),
@room_No int,
@room_type varchar(10),
@price_adult int,
@price_child int
AS
BEGIN
Insert into Rooms values(@hotel_id,@room_No,@room_type,@price_adult,@price_child);
End


GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[InPin]    Script Date: 12/7/2017 8:49:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[InPin]
@pin int,
@state varchar(10),
@city varchar(20)
as
begin
declare @row int 
select @row=count(*) from PinCodes where pin=@pin;
if(@row<1)
INSERT INTO PinCodes (pin,state,city) values(@pin,@state,@city);
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[Delete_booking]    Script Date: 12/7/2017 8:49:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Delete_booking]
@Booking_id varchar(10)
as
begin 
delete from Booking where Booking_id=@Booking_id
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[Delete_customer]    Script Date: 12/7/2017 8:50:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Delete_customer]
@Customer_id varchar(10)
as
begin 
delete from Customers where id=@Customer_id
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[Delete_hotel]    Script Date: 12/7/2017 8:50:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Delete_hotel]
@Hotel_id varchar(8)
as
begin 
delete from Hotels where id=@Hotel_id
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[Delete_manager]    Script Date: 12/7/2017 8:50:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Delete_manager]
@Manager_id varchar(5)
as
begin 
delete from Managers where id=@Manager_id
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[Delete_payment]    Script Date: 12/7/2017 8:50:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Delete_payment]
@Payment_id varchar(8)
as
begin 
delete from Payment where id=@Payment_id
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetBookingDetails]    Script Date: 12/7/2017 8:50:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[GetBookingDetails]
@Booking_id varchar(10),
@Hotel_id varchar(50) out ,
@Booking_Date date out,
@Arrival_Date date out,
@Departure_Date date out,
@Number_of_Adults int out,
@Number_of_Children int out,
@Number_of_Nights int out ,
@Number_of_AC_Rooms int out,
@Number_of_Non_AC_Rooms int out
as
begin
select @Booking_id=Booking_id,@Hotel_id=Hotel_id,@Booking_Date=Date_booking,@Arrival_Date=Date_checkin,@Departure_Date=Date_checkout,@Number_of_Adults=no_adult,@Number_of_Children=no_child,@Number_of_Nights=no_nights,@Number_of_AC_Rooms=No_Of_AC_Rooms,@Number_of_Non_AC_Rooms=No_Of_Non_AC_Rooms  from Booking where Booking_id=@Booking_id ;
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetBookingDetailsCustomer]    Script Date: 12/7/2017 8:50:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[GetBookingDetailsCustomer]
@Customer_id varchar(10)
as
begin
select * from Booking where Customer_id=@Customer_id;
end


GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetCities]    Script Date: 12/7/2017 8:50:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[GetCities]
as 
begin
select distinct city from PinCodes
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetCitiesStates]    Script Date: 12/7/2017 8:50:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[GetCitiesStates]
as 
begin
select city,state from PinCodes
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetCustomerDetails]    Script Date: 12/7/2017 8:50:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[GetCustomerDetails]
@customer_id varchar(7),
@name varchar(50) out ,
@c_contact bigint out,
@c_email varchar(30) out,
@dob date out,
@pincode int out,
@state varchar(20)out,
@city varchar(20)out,
@password varchar(25) out
 
as
begin
select	@name=C.name,
		@c_contact=C.c_contact,
		@c_email=C.c_email,
		@dob=C.Dob,
		@pincode=C.pincode,
		@password=C.password,
		@city=P.city,
		@state=P.state
	from Customers as C join PinCodes as P on p.pin=C.pincode where id=@customer_id ;
end 


GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetHotelDetails]    Script Date: 12/7/2017 8:50:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[GetHotelDetails]
@hotel_id varchar(7),
@name varchar(50) out ,
@hotel_description varchar(max) out,
@pincode int out,
@state varchar(20) out,
@city varchar(20) out,
@manager_id varchar(10) out,
@ac_room int out,
@non_ac_room int out 
 
as
begin
select @name=h.name,@hotel_description=h.hotel_description,
@pincode=h.pincode,
@manager_id=h.manager_id,@ac_room=h.no_of_ac_rooms,@non_ac_room=h.no_of_non_ac_rooms,
@state=p.state,@city=p.city from Hotels as h join PinCodes as p on p.pin=h.pincode where id=@hotel_id ;
end


GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetManagerDetails]    Script Date: 12/7/2017 8:51:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create Procedure [dbo].[GetManagerDetails]
@manager_id varchar(7),
@name varchar(20) out ,
@password varchar(25) out,
@m_contact bigint out,
@m_email varchar(30) out
 
as
begin
select	@name=name,
		@password=password,
		@m_contact=m_contact,
		@m_email=m_email		
	from Managers where id=@manager_id ;
end 

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetManagerHotels]    Script Date: 12/7/2017 8:51:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[GetManagerHotels]
@manager_id varchar(10)
as
begin
select h.id,h.name,h.hotel_description,h.no_of_ac_rooms,h.no_of_non_ac_rooms,h.pincode from Hotels as h join PinCodes as p on p.pin=h.pincode where @manager_id=manager_id ;
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetManagerHotels2]    Script Date: 12/7/2017 8:51:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[GetManagerHotels2]
@manager_id varchar(10)
as
begin
select h.id,h.name,h.hotel_description,h.no_of_ac_rooms,h.no_of_non_ac_rooms,h.pincode,p.state,
p.city,ra.price_adult as Cost_ac_adult,ra.price_child as Cost_ac_child,rn.price_adult as Cost_non_ac_adult,rn.price_child as Cost_non_ac_child
from Hotels as h join PinCodes as p on p.pin=h.pincode 
join Rooms as ra on h.id=ra.hotel_id and ra.room_type='AC' 
join Rooms as rn on h.id=rn.hotel_id and rn.room_type='NON AC' 
where h.manager_id= @manager_id ;
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 12/7/2017 8:51:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[GetStates]
as 
begin
select distinct state from PinCodes
end

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[hotel_room_avilablity]    Script Date: 12/7/2017 8:51:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




														CREATE procedure [dbo].[hotel_room_avilablity]
														as 
														begin
														select * from (
														select h.id as HotelID,h.name as HotelName,p.state as State,p.city as City,ISNULL(h.no_of_ac_rooms-(select sum(No_Of_AC_Rooms) from Booking as b  where b.Hotel_id=h.id group by b.Hotel_id),h.no_of_ac_rooms) as AcRooms
														,ISNULL(h.no_of_non_ac_rooms-(select sum(No_Of_Non_AC_Rooms) from Booking as b  where b.Hotel_id=h.id group by b.Hotel_id),h.no_of_non_ac_rooms) as NonAcRooms
														from hotels as h join PinCodes as p on h.pincode=p.pin) as AvilableHotel 
														where AvilableHotel.AcRooms>0 and AvilableHotel.NonAcRooms>0

														end 



GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[hotel_room_avilablity_CCIO]    Script Date: 12/7/2017 8:51:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


														CREATE procedure [dbo].[hotel_room_avilablity_CCIO]
														@state varchar(10),
														@city varchar(20),
														@indate date,
														@outdate date
														as 
														begin
														select * from (
														select h.id,h.name,p.state,p.city,ISNULL(h.no_of_ac_rooms-(select sum(No_Of_AC_Rooms) from Booking as b  where b.Hotel_id=h.id group by b.hotel_id),h.no_of_ac_rooms) as avilabe_ac_rooms
														,ISNULL(h.no_of_non_ac_rooms-(select sum(No_Of_Non_AC_Rooms) from Booking as b  where b.Hotel_id=h.id group by b.hotel_id),h.no_of_non_ac_rooms) as avilabe_non_ac_rooms
														from hotels as h join PinCodes as p on h.pincode=p.pin where p.city like @city and p.state like @state
														)as filter 
														where filter.avilabe_ac_rooms>0 or filter.avilabe_non_ac_rooms>0

														end 

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[InBooking]    Script Date: 12/7/2017 8:51:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[InBooking]
@Booking_id varchar(50) out,
@Customer_id varchar(10),
@Hotel_id varchar(7),
@No_Of_AC_Rooms int,
@No_Of_Non_AC_Rooms int,
@T_id varchar(50),
@Date_booking date,
@Date_checkin date,
@Date_checkout date,
@no_adult int,
@no_child int
AS
BEGIN
declare @no_nights int
set @no_nights = DATEDIFF(day,@Date_checkin,@Date_checkout)
set @Booking_id=concat( substring(@Hotel_id,1,3),substring(@Customer_id,1,3), ROUND(((9999 - 1000-1) * RAND() + 1000), 0))
INSERT INTO [dbo].[Booking]
           ([Booking_id]
           ,[Customer_id]
           ,[Hotel_id]
           ,[No_Of_AC_Rooms]
           ,[No_Of_Non_AC_Rooms]
           ,[T_id]
           ,[Date_booking]
           ,[Date_checkin]
           ,[Date_checkout]
           ,[no_adult]
           ,[no_child]
           ,[no_nights])
     VALUES
           (@Booking_id
           ,@Customer_id
           ,@Hotel_id
           ,@No_Of_AC_Rooms
           ,@No_Of_Non_AC_Rooms
           ,@T_id
           ,@Date_booking
           ,@Date_checkin
           ,@Date_checkout
           ,@no_adult
           ,@no_child 
           ,@no_nights)
End

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[InCustomerDetails]    Script Date: 12/7/2017 8:51:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[InCustomerDetails]
@customer_id varchar(15) out,
@c_name varchar(20),
@c_contact bigint,
@c_email varchar(30),
@dob date,
@pin int,
@state varchar(20),
@city varchar(20),
@password varchar(25)

as
begin
	exec InPin @pin, @state, @city
	declare @CharPool varchar(10)
	declare @PoolLength int
	SET @CharPool = '!$@#^&*' SET @PoolLength = Len(@CharPool)
	declare	@RandomString varchar(10) 
	Set @RandomString= SUBSTRING(@charpool, convert(int, ROUND(((@PoolLength -2) * RAND() + 1),0)), 1)
		set @customer_id=concat( substring(@c_name,1,1), @RandomString, ROUND(((999 - 100-1) * RAND() + 100),0))
	insert into Customers values (@customer_id,@c_name,@c_contact,@c_email,@dob,@pin,@password)
	
end


GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[InHotel]    Script Date: 12/7/2017 8:52:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[InHotel]
@hotel_id varchar(7) out,
@name varchar(50),
@hotel_description varchar(max),
@pincode int,
@state varchar(20),
@city varchar(20),
@manager_id varchar(10),
@ac_room int,
@non_ac_room int 
AS
BEGIN 
exec InPin @pincode, @state, @city 

set @hotel_id=concat( substring(@name,1,3), ROUND(((9999 - 1000-1) * RAND() + 1000), 0))
Insert into Hotels values(@hotel_id,@name,@hotel_description,@pincode,@manager_id,@ac_room,@non_ac_room);
End

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[InManagerDetails]    Script Date: 12/7/2017 8:52:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[InManagerDetails]
@manager_id varchar(15) out,
@m_name varchar(20),
@m_password varchar(25),
@m_contact bigint,
@m_email varchar(30)
as
begin
	--exec InPin @pin, @country, @city
	declare @CharPool varchar(10)
	declare @PoolLength int
	SET @CharPool = '!$@#%^&*' SET @PoolLength = Len(@CharPool)
	declare	@RandomString varchar(10) 
	Set @RandomString= SUBSTRING(@charpool, convert(int, ROUND(((@PoolLength -2) * RAND() + 1),0)), 1)
	set @manager_id=concat( substring(@m_name,1,2), @RandomString, ROUND(((99 - 10-1) * RAND() + 10),0))
	insert into Managers values (@manager_id,@m_name,@m_password,@m_contact,@m_email)
	
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[Price]    Script Date: 12/7/2017 8:52:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Price]
@hotel_id varchar(7)  ,
@price_adult_ac_room int  out ,
@price_child_ac_room int out ,
@price_adult_non_ac_room int out,
@price_child_non_ac_room int out

as
begin
select @price_adult_ac_room=price_adult,@price_child_ac_room=price_child from Rooms where 
hotel_id=@hotel_id and room_type like 'ac'
select @price_adult_non_ac_room=price_adult,@price_child_non_ac_room=price_child from Rooms where 
hotel_id=@hotel_id and room_type like 'non ac'
end


GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[sp_customer_login]    Script Date: 12/7/2017 8:52:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_customer_login]
(
 @username varchar(100),
 @password   varchar(100),
 @customerstatus int out
 )
AS
BEGIN
              if exists(select id,password from customers where id=@UserName and password=@Password)

       set @customerstatus=1

else

       set @customerstatus=0
END


GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[sp_emailverifyC]    Script Date: 12/7/2017 8:52:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[sp_emailverifyC]
(
 @email varchar(20),
 @customerstatus int out
 )
AS
BEGIN
              if exists(select * from customers where c_email=@email)

       set @customerstatus=1

else

       set @customerstatus=0
END



GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[sp_emailverifyM]    Script Date: 12/7/2017 8:52:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[sp_emailverifyM]
(
 @email varchar(20),
 @customerstatus int out
 )
AS
BEGIN
              if exists(select * from Managers where m_email=@email)

       set @customerstatus=1

else

       set @customerstatus=0
END



GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[sp_Managers_login]    Script Date: 12/7/2017 8:52:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_Managers_login]
(
 @username varchar(100),
 @password   varchar(100),
 @Managersstatus int out
 )
AS
BEGIN
              if exists(select id,password from Managers where id=@UserName and password=@Password)

       set @Managersstatus=1

else

       set @Managersstatus=0
END

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[sp_payment]    Script Date: 12/7/2017 8:53:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_payment]
(
@Bank_Id varchar(10),
@CreditCardNo  bigint,
@Cardtype varchar (10),	
@NameOnCard	varchar(30),	
@ExpiryDate	date,	
@CVV	int	,
@AccountNumber	bigint,
@Pin	int,	

 @paystatus int out
 )
 As
 Begin
 if exists (Select card_no,name_on_card,card_type,cvc_no,pin,account_no,exp_date from Card_details where Bank_id=@Bank_Id and card_no=@CreditCardNo and card_type=@Cardtype and name_on_card=@NameonCard and cvc_no=@CVV and pin=@pin and account_no=@AccountNumber and exp_date=@ExpiryDate)
 
 set @paystatus=1

else

 set @paystatus=0

 END

GO
USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[sp_store_payment]    Script Date: 12/7/2017 8:53:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_store_payment]
@payment_id varchar(8) out,
@Hotel_id varchar(7),
@customer_Id varchar(5),
@booking_name varchar(50),
@total_Cost int,
@card_number int,
@card_type varchar(50)

AS
Begin
--declare @pay_status int
--@
set @payment_id=concat( substring(@Hotel_id,1,3),ROUND(((999 - 100-1) * RAND() + 100), 0),substring(@booking_name,1,2))
insert into Payment values (@payment_id,@Hotel_id,@customer_Id,@booking_name,@total_Cost,@card_number,@card_type)
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[UpdateBookingDetails]    Script Date: 12/7/2017 8:53:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[UpdateBookingDetails]
@Booking_id varchar(50),
@No_Of_Ac_Rooms int,
@No_Of_Non_Ac_Rooms int,

@Date_Of_ChekInn date,
@Date_Of_CheckOut date,
@No_Of_Adults int,
@No_Of_Children int
as 
begin
update Booking set No_Of_AC_Rooms =@No_Of_Ac_Rooms,No_Of_Non_AC_Rooms=@No_Of_Non_Ac_Rooms,Date_checkin=@Date_Of_ChekInn,Date_checkout=@Date_Of_CheckOut,no_adult=@No_Of_Adults,no_child=@No_Of_Children where Booking_id=@Booking_id
end

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCustomerDetails]    Script Date: 12/7/2017 8:53:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[UpdateCustomerDetails]
@Customer_id varchar(7) ,
@name varchar(20),
@c_contact bigint,
@c_email varchar(10),
@Dob date,
@pin int,
@state varchar(20),
@city varchar(20),
@password varchar(25) 
AS
BEGIN
 exec InPin @pin,@state,@city
 update Customers set name=@name,c_contact=@c_contact,c_email=@c_email,Dob=@Dob,pincode=@pin,password=@password where id=@Customer_id;
End



GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[UpdateHotel]    Script Date: 12/7/2017 8:53:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[UpdateHotel]
@hotel_id varchar(7) ,
@name varchar(50),
@hotel_description varchar(max),
@pin int,
@state varchar(20),
@city varchar(20),
@manager_id varchar(10),
@ac_room int,
@non_ac_room int,
@price_adult_ac int,
@price_adult_nonac int,
@price_child_ac int,
@price_child_nonac int
AS
BEGIN
exec InPin @pin, @state, @city 
 update Hotels set name=@name,hotel_description=@hotel_description,pincode=@pin,manager_id=@manager_id,no_of_ac_rooms=@ac_room,no_of_non_ac_rooms=@non_ac_room where id=@hotel_id;
 update Rooms set price_adult=@price_adult_ac,price_child=@price_child_ac where hotel_id=@hotel_id and room_type='AC';
 update Rooms set price_adult=@price_adult_nonac,price_child=@price_child_nonac where hotel_id=@hotel_id and room_type='NON AC';
 
End


GO

USE [Hotel_Reservation_System]
GO

/****** Object:  StoredProcedure [dbo].[UpdateManagerDetails]    Script Date: 12/7/2017 8:53:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[UpdateManagerDetails]
@manager_id varchar(7) ,
@name varchar(20),
@password varchar(25) ,
@m_contact bigint,
@m_email varchar(10)


AS
BEGIN
 update Managers set name=@name,password=@password, m_contact= @m_contact,m_email=@m_email where id=@manager_id;
End



GO






















