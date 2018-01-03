create database [Hotel_Reservation_System];
USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[PinCodes]    Script Date: 12/7/2017 8:39:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PinCodes](
	[pin] [int] NOT NULL,
	[state] [varchar](20) NOT NULL,
	[city] [varchar](20) NOT NULL,
 CONSTRAINT [pk_PinCode] PRIMARY KEY CLUSTERED 
(
	[pin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Bank_details]    Script Date: 12/7/2017 8:37:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bank_details](
	[Bank_id] [varchar](10) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [pk_bank_id] PRIMARY KEY CLUSTERED 
(
	[Bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 12/7/2017 8:38:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[id] [varchar](10) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[c_contact] [bigint] NOT NULL,
	[c_email] [varchar](30) NOT NULL,
	[Dob] [date] NOT NULL,
	[pincode] [int] NOT NULL,
	[password] [varchar](25) NOT NULL,
 CONSTRAINT [pk_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [fk_pinCode_cust] FOREIGN KEY([pincode])
REFERENCES [dbo].[PinCodes] ([pin])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [fk_pinCode_cust]
GO

USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Managers]    Script Date: 12/7/2017 8:38:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Managers](
	[id] [varchar](5) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[m_contact] [bigint] NOT NULL,
	[m_email] [varchar](30) NOT NULL,
 CONSTRAINT [pk_Manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Hotels]    Script Date: 12/7/2017 8:38:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Hotels](
	[id] [varchar](7) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[hotel_description] [varchar](max) NOT NULL,
	[pincode] [int] NOT NULL,
	[manager_id] [varchar](5) NOT NULL,
	[no_of_ac_rooms] [int] NULL,
	[no_of_non_ac_rooms] [int] NOT NULL,
 CONSTRAINT [PK_Hotel_Id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_Managers] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Managers] ([id])
GO

ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_Hotels_Managers]
GO

ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_PinCodes_id] FOREIGN KEY([pincode])
REFERENCES [dbo].[PinCodes] ([pin])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_Hotels_PinCodes_id]
GO
USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Card_details]    Script Date: 12/7/2017 8:39:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Card_details](
	[card_no] [int] NOT NULL,
	[name_on_card] [varchar](20) NOT NULL,
	[cvc_no] [int] NOT NULL,
	[pin] [int] NOT NULL,
	[account_no] [int] NOT NULL,
	[exp_date] [date] NOT NULL,
	[Bank_id] [varchar](10) NOT NULL,
	[card_type] [varchar](10) NOT NULL,
 CONSTRAINT [pk_card] PRIMARY KEY CLUSTERED 
(
	[card_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Card_details]  WITH CHECK ADD  CONSTRAINT [fk_card_bank_id] FOREIGN KEY([Bank_id])
REFERENCES [dbo].[Bank_details] ([Bank_id])
GO

ALTER TABLE [dbo].[Card_details] CHECK CONSTRAINT [fk_card_bank_id]
GO
USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Payment]    Script Date: 12/7/2017 8:39:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Payment](
	[id] [varchar](8) NOT NULL,
	[Hotel_id] [varchar](7) NOT NULL,
	[customer_Id] [varchar](10) NOT NULL,
	[booking_name] [varchar](50) NOT NULL,
	[total_Cost] [int] NOT NULL,
	[card_number] [int] NOT NULL,
	[card_type] [varchar](50) NOT NULL,
 CONSTRAINT [pk_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [fk_Payment_Card_details] FOREIGN KEY([card_number])
REFERENCES [dbo].[Card_details] ([card_no])
GO

ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [fk_Payment_Card_details]
GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [fk_Payment_Hotels_id] FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotels] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [fk_Payment_Hotels_id]
GO
USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Booking]    Script Date: 12/7/2017 8:39:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Booking](
	[Booking_id] [varchar](50) NOT NULL,
	[Customer_id] [varchar](10) NOT NULL,
	[Hotel_id] [varchar](7) NOT NULL,
	[No_Of_AC_Rooms] [int] NULL,
	[No_Of_Non_AC_Rooms] [int] NOT NULL,
	[T_id] [varchar](8) NOT NULL,
	[Date_booking] [date] NULL,
	[Date_checkin] [date] NULL,
	[Date_checkout] [date] NULL,
	[no_adult] [int] NOT NULL,
	[no_child] [int] NULL,
	[no_nights] [int] NULL,
 CONSTRAINT [PK_BOOKING_ID] PRIMARY KEY CLUSTERED 
(
	[Booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Fk_Customer_id] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customers] ([id])
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Fk_Customer_id]
GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Fk_Hotel_id] FOREIGN KEY([Hotel_id])
REFERENCES [dbo].[Hotels] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Fk_Hotel_id]
GO

ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [Fk_T_id] FOREIGN KEY([T_id])
REFERENCES [dbo].[Payment] ([id])
GO

ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [Fk_T_id]
GO



USE [Hotel_Reservation_System]
GO

/****** Object:  Table [dbo].[Rooms]    Script Date: 12/7/2017 8:40:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rooms](
	[hotel_id] [varchar](7) NOT NULL,
	[room_No] [int] NOT NULL,
	[room_type] [varchar](10) NOT NULL,
	[price_adult] [int] NOT NULL,
	[price_child] [int] NOT NULL,
 CONSTRAINT [PK_room_no_hotel_id] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC,
	[room_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [Fk_Rooms_Hotel_Id] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotels] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [Fk_Rooms_Hotel_Id]
GO



