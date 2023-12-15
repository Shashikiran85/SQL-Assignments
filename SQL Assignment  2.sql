Create Database Order_Stores_Data											
											
Create Table Orders_Table											
(											
 OrderDate Date,											
 Region Char(100),											
 Rep  Varchar(155),											
 Order_Item varchar(155),											
 Units int,											
 UnitCost Money,											
 Total_price Money,											
 Order_id int											
 )											
											
 Create Table Stores_Table											
(											
Store_Id int,											
StoreType char(55),											
Assortment int,											
CompetitionDistance int,											
Month int,											
Year int,											
PromoInterval varchar(155)											
)											
											
select * from Orders_Table											
											
											
Insert into Orders_Table values ('2021-01-06' , 'East' ,  'Aruna' , 'Pencil', 95 , 1.99 ,189.05 , 1)											
Insert into Orders_Table values ('2021-01-23' ,'Central', 'Kivell', 'Eraser', 50 , 19.99 , 999.50 ,2)											
Insert into Orders_Table values ('2021-02-09' ,'Central', 'Ganesh', ' ', 36 , 4.99 , 179.64 ,3)											
Insert into Orders_Table values ('2021-02-26' ,'Central', 'Payal', ' ', 27 , 19.99 , 539.73 ,4)											
Insert into Orders_Table values ('2021-03-15' ,'West', 'Sorvino', ' ', 56 , 2.99 , 167.44 , 5)											
Insert into Orders_Table values ('2021-01-04' ,'East', 'Hitesh', 'Pencil', 60 , 4.99 , 299.40 , 6)											
Insert into Orders_Table values ('2021-04-18' ,'Central', 'Akshita', ' ', 75 , 1.99 , 149.25 , 7)											
Insert into Orders_Table values ('2021-05-05' ,'Central', 'Ruchika', 'Books', 90 , 4.99 , 449.10 , 8)											
Insert into Orders_Table values ('2021-05-22' ,'West', 'Surbhi', ' ', 32 , 1.99 , 63.68 , 9)											
Insert into Orders_Table values ('2021-06-08' ,'East', 'Jones', 'Suitcase ', 60 , 8.99 , 539.40 , 10)											
											
											
select * from Stores_Table											
											
Insert into Stores_Table values  ( 1 ,'c', 10 , 1270 , 9 , 2008 , 'Jan')											
Insert into Stores_Table values  ( 2 ,'a', 48 , 570 , 11 , 2007 , 'Feb')											
Insert into Stores_Table values  ( 3 ,'a', 22 , 14130 , 12 , 2006 , 'Mar')											
Insert into Stores_Table values  ( 4 ,'c', 37 , 620 , 9 , 2009 , ' ')											
Insert into Stores_Table values  ( 5 ,'a', 41 , 29910 , 4 , 2015 , 'May')											
Insert into Stores_Table values  ( 6 ,'a', 13 , 310, 12 , 2013 , 'June')											
Insert into Stores_Table values  ( 7 ,'a', 50 , 24000, 4 , 2013 , ' ')											
Insert into Stores_Table values  ( 8 ,'a', 40 , 7520, 10 , 2014 , 'Aug ')											
Insert into Stores_Table values  ( 9 ,'a', 48 , 2030, 8 , 2000 , ' ')											
Insert into Stores_Table values  ( 10 ,'a', 36 , 3160, 9 , 2009 , 'Oct ')											
											
											
/*Make Order_Id  Column as Primary Key.*/											
											
											
 Select * From Orders_Table											
											
Alter table Orders_Table											
Add constraint PK_Orders_Table  Primary key (Order_id)											
											
 Alter table Orders_Table											
 Alter Column Order_id  INt Not null											
											
 Alter table Orders_Table											
Add constraint PK_Orders_Table  Primary key (Order_id)											
											
											
/* Add one Column Name  as Store_Names and insert the records given above in Stores table.*/											
											
select * from Stores_Table											
											
Alter Table Stores_Table											
Add Store_names Varchar(155)											
											
Update  Stores_Table											
set Store_names = case Store_Id											
                             when 1 then  'car'											
                             when 2 then  'Bikes'											
							 when 3 then  'Hardware'				
							 when 4 then  'Electrics'				
							 when 5 then  'Fibers'				
							 when 6 then  'Elastics'				
							 when 7 then  'Books'				
							 when 8 then  'Shoes'				
							 when 9 then  'Clothes'				
							 when 10 then  'Scraps'				
							 Else  null				
							 End				
											
select * from  Stores_Table											
											
											
/*Make Stored_Id as a Foreign Key with reference too Orders_Table */											
 											
 Alter Table Stores_table 											
 Add Constraint FK_Stores_table 											
 Foreign key(Store_id)											
 References Orders_table(Order_id)											
											
 /*Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet*/											
											
											
  Select * From Orders_Table											
											
  update Orders_Table											
  set Order_Item = case Order_id											
                        when 3 then   'Compass'											
						when 4 then   'Torch'					
						When  5 then  'Phone'					
						When 7 then   'Laptop'					
						When 9  then  'Box'					
						Else Order_Item 					
						End					
											
	/*Update the missing records in the PromoInterval Column in Stores Table.*/										
											
				select * from  Stores_Table							
											
				Update  Stores_table							
				set PromoInterval = Case Store_Id							
				                            when 4 then 'April'							
											When 7 then 'July'
											When 9 then 'Sep'
											Else PromoInterval
											End
											
		/*Rename the column name  of Assortment to Store_Nos in Stores_Table.*/									
											
		select * from  Stores_Table									
											
											
		Exec sp_rename 'Stores_Table.Assortment' , 'Store_Nos', 'Column'									
											
											
	/*Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.*/										
											
	 Select * From Orders_Table										
											
	 Exec sp_rename 'Orders_table.Order_item','Item_name' , 'Column'										
	 Go										
	 Exec sp_rename 'Orders_table.Rep','Customers_name' , 'Column'										
	 										
											
	/* Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.*/										
											
	Select * from Orders_Table										
	Order by UnitCost desc , Total_price asc										

/*	Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.*/


	Select Region, COUNT(Distinct Customers_Name) as Cus_name from  Orders_Table
	Group by Region


	/*Find the sum of Total_Price Column and Unit Cost  in Orders_Table */

	 select * from orderS_table

	 select sum(UnitCost) As UnitCost, Sum(Total_price) as Total_price from Orders_Table

	/* Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.*/

	select * from orderS_table
	select * from  Stores_Table		

	with Orderstoredata As (
	
	SELECT ORDERDATE, UNITCOST, ST.STORETYPE, ST.YEAR FROM Orders_Table OT
	JOIN
   STORES_TABLE ST
	ON ORDER_iD = STORE_ID)

	select *
	into Order_store_Table
	From Orderstoredata

	select* from Order_store_Table

	/*Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9*/

	Select Item_name, Region, OrderDate
	from Orders_Table
	where Order_id in (4, 5, 6,9)

/*	Show me year  whose ComptetitionDistance is 29910  , 310 , 3160 */

     select * from Orders_Table
	 select * from Stores_Table

	 Select YEAR
	 From Stores_Table
	 where CompetitionDistance in (29910, 310,3160)


/*	Give me that Item_name whose  Total_Price is greater than 200 and less than 400 */

  select * from Orders_Table

  Select Item_name 
  from Orders_Table
  where 
  Total_price > 200 and Total_price < 400

 /* Rename the CompetitionDistance as CD and find the total CD in Stores_Table*/

  Select * from Stores_Table

  Exec  sp_rename 'stores_table.CompetitionDistance ', 'CD' , 'Column'

  Select   sum (CD) as Total_CD from Stores_Table


 /* What is the Total Count of Stores_Type and CD columns*/

    select 
	count(distinct StoreType) Total_storetype , COUNT( CD) Total_cd
	from Stores_Table

/*	Apply the Cross Join in  Orders_Table and Stores_Table.*/

    

	 select * from Orders_Table
	 cross join Stores_Table
	 

 /*DROP both the databases*/
  
  Drop Database Order_Stores_Data

