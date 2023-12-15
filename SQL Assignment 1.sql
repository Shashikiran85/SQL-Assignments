Create Database Brands;

Create Database Products;

Use Brands;

Create Table ITEMS_Table
(
 Item_Id int,
 item_description varchar(155),
 vendor_nos int,
 vendor_name char(100),
 bottle_size int,
 bottle_price Decimal(6,2)
 )

 Use Products;

 Create table PRODUCT_Table
 (
  Product_Id int,
  Country Varchar(155),
  Product Char(155),
  UnitsSold decimal(6,2),
  Manufacturing_Price decimal(6,2),
  Sale_Price decimal(10,2),
  Gross_Sales decimal(10,2),
  Sales  decimal(10,2),
  COGS decimal(10,2),
  Profit decimal(10,2),
  Date date,
  Month_number int,
  Month_name Char(55),
  Year int
  )

  alter table Product_table
  alter column sale_price money

  select * from ITEMS_Table
  Insert into ITEMS_Table values (1	,'Travis Hasse Apple Pie',305 ,'Mhw Ltd', 750,9.77)
  Insert into ITEMS_Table values (2	,'Daristi Xtabentun',391 ,' Anchor Distilling (preiss Imports)', 750 , 14.12 )
  Insert into ITEMS_Table values (3,'Hiram Walker Peach Brandy', 370 , 'Pernod Ricard Usa/austin Nichols', 1000,6.50)
  Insert into ITEMS_Table values (4,'Oak Cross Whisky', 305 ,'Mhw Ltd', 750 , 25.33)
  Insert into ITEMS_Table values (5, 'Uv Red(cherry) Vodka',380 ,'Phillips Beverage Company', 200 , 1.97)
  Insert into ITEMS_Table values (6, 'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750, 6.37)
  Insert into ITEMS_Table values (7, 'Hyde Herbal Liqueur', 194 ,' Fire Tail Brands Llc ', 750 , 5.06)
  Insert into ITEMS_Table values (8, 'Dupont Calvados Fine Reserve', 403 ,' Robert Kacher Selections ', 750 , 23.61) 



  Select * from PRODUCT_Table

  Insert into PRODUCT_Table values (1, 'Canada',' Carretera', 1618.5, 3.00, $20.00, 32370.00 , 32370.00, 16185.00, 16185.00, '2014-01-01',1,' January' ,	2014)
  Insert into PRODUCT_Table values (2, 'Germany','Carretera', 1321, 3.00, $20.00, 26420.00, 26420.00, 13210.00, 13210.00,  '2014-01-01', 1,'January' , 2015)
  Insert into PRODUCT_Table values (3,'France',' Carretera',2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-06-01',6,' June', 2016)
  Insert into PRODUCT_Table values (4,'Germany',' Carretera',888 , 3.00,  15.00, 13320.00, 13320.00,  8880.00, 4440.00, '2014-06-01',6, ' June',2017)
  Insert into PRODUCT_Table values (5,'Mexico',' Carretera ', 2470,3.00 , 15.00, 37050.00, 37050.00 , 24700.00, 12350.00, '2014-06-01',6, ' June', 2018)
  Insert into PRODUCT_Table values (6,'Germany',' Carretera',1513, 3.00 , 350.00, 529550.00,  529550.00 ,393380.00, 136170.00,'2014-12-01',12, ' December',2019)
  Insert into PRODUCT_Table values (7,'Germany',' Montana',921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01',3,  ' March', 2020) 
  Insert into PRODUCT_Table values (8,'Canada',' Montana',2518, 5.00, 12.00, 30216.00 , 30216.00, 7554.00, 22662.00, '01-06-2014',6 ,' June', 2021) 

   Select * from PRODUCT_Table

   Delete from PRODUCT_Table
   where UnitsSold In (1618.5,888 ,2470)

   Select * from PRODUCT_Table

   Drop table PRODUCT_Table

     Select * from PRODUCT_Table


  Create table PRODUCT_Table
 (
  Product_Id int,
  Country Varchar(155),
  Product Char(155),
  UnitsSold decimal(6,2),
  Manufacturing_Price decimal(6,2),
  Sale_Price decimal(10,2),
  Gross_Sales decimal(10,2),
  Sales  decimal(10,2),
  COGS decimal(10,2),
  Profit decimal(10,2),
  Date date,
  Month_number int,
  Month_name Char(55),
  Year int
  )

  Select * from PRODUCT_Table

  Insert into PRODUCT_Table values (1, 'Canada',' Carretera', 1618.5, 3.00, 20.00, 32370.00 , 32370.00, 16185.00, 16185.00, '2014-01-01',1,' January' ,	2014)
  Insert into PRODUCT_Table values (2, 'Germany','Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00,  '2014-01-01', 1,'January' , 2015)
  Insert into PRODUCT_Table values (3,'France',' Carretera',2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-06-01',6,' June', 2016)
  Insert into PRODUCT_Table values (4,'Germany',' Carretera',888 , 3.00,  15.00, 13320.00, 13320.00,  8880.00, 4440.00, '2014-06-01',6, ' June',2017)
  Insert into PRODUCT_Table values (5,'Mexico',' Carretera ', 2470,3.00 , 15.00, 37050.00, 37050.00 , 24700.00, 12350.00, '2014-06-01',6, ' June', 2018)
  Insert into PRODUCT_Table values (6,'Germany',' Carretera',1513, 3.00 , 350.00, 529550.00,  529550.00 ,393380.00, 136170.00,'2014-12-01',12, ' December',2019)
  Insert into PRODUCT_Table values (7,'Germany',' Montana',921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01',3,  ' March', 2020) 
  Insert into PRODUCT_Table values (8,'Canada',' Montana',2518, 5.00, 12.00, 30216.00 , 30216.00, 7554.00, 22662.00, '01-06-2014',6 ,' June', 2021) 


  Select sum(sale_price) as Total_sale_price,
          sum(Gross_sales) as Total_Gross_sales
		   from PRODUCT_Table

/*2) In which year we have got the highest sales*/

Select * from PRODUCT_Table

    select     Top 1
            Year, Max(sales) as Highest_sales
            from PRODUCT_Table
			Group by Year
			order by Highest_sales desc

/*3)  Which Product having the sales of $ 37,050.00*/
 
    Select * from PRODUCT_Table

	        select Product 
	        from  PRODUCT_Table
		     where  Sales = 37050.00

/*4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00*/
		 
		 SELECT Country, profit from PRODUCT_Table
		 Where profit between 4605 and 22662

/*5) Which Product Id having the sales of $ 24 , 700.00*/

		select * from PRODUCT_Table

		select Product_Id 
		     from PRODUCT_Table
		   where Sales = 24700

		   select product_id , COGS
		   from PRODUCT_Table
		   where COGS = 24700


/*1) Find the item_description having the bottle size of 750*/

      select * from ITEMS_Table
	   
	select item_description
	       from Items_table
		   where bottle_size = 750


/*2) Find the vendor Name having the vendor_nos 305 , 380 , 391*/
   
      select * from Items_table

	   select vendor_name from items_table
	          where vendor_nos in (305 , 380,391)


/*	 3) What is total Bottle_price */

      select sum(bottle_price) as Total_Bottle_price 
	       
		   from Items_table


/*  4 ) Make Primary Key to Item_id */

     select * from Items_table

	 alter table items_table
	 add constraint pk_items primary key(item_id)

	 
/*Which item id having the bottle_price of $ 5.06*/

     select * from Items_table

	 select Item_id , bottle_price 
	 from items_table
	 where bottle_price = 5.06


/* 1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table */
  
   select tab1.*,
          tab2.*
		  From [Brands].[dbo].[ITEMS_Table] tab1
		  Inner join
		  [Products]. [dbo].[PRODUCT_Table] tab2
		 on tab1.Item_Id = tab2.Product_Id


		 /* Full Outer */

		 select tab1.*,tab2.*
		  From [Brands].[dbo].[ITEMS_Table] tab1
		  full outer join
		  [Products]. [dbo].[PRODUCT_Table] tab2
		  on tab1.Item_Id = tab2.Product_Id


		  /*left join*/

		  select Tab1.*, Tab2.*
		  From [Brands].[dbo].[ITEMS_Table] Tab1
		  Left join
		  [Products].[dbo].[PRODUCT_Table] Tab2
		  on Tab1.Item_Id = Tab2.Product_Id

/*Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table */

 /*  left outer join*/
     
	 select Tab1.*, Tab2.*
		  From [Brands].[dbo].[ITEMS_Table] Tab1
		  Left outer join
		  [Products].[dbo].[PRODUCT_Table] Tab2
		  on Tab1.Item_Id = Tab2.Product_Id

 /* Right outer join*/

      select Tab1.*, Tab2.*
		  From [Brands].[dbo].[ITEMS_Table] Tab1
		  right outer join
		  [Products].[dbo].[PRODUCT_Table] Tab2
		  on Tab1.Item_Id = Tab2.Product_Id

/* Full outer join*/
        select Tab1.*, Tab2.*
		  From [Brands].[dbo].[ITEMS_Table] Tab1
		  full outer join
		  [Products].[dbo].[PRODUCT_Table] Tab2
		  on Tab1.Item_Id = Tab2.Product_Id


/* cross join*/

     select Tab1.*, Tab2.*
		  From [Brands].[dbo].[ITEMS_Table] Tab1
		  cross join
		  [Products].[dbo].[PRODUCT_Table] Tab2


/*3) Find the item_description and Product having the gross sales of 13,320.00*/
		  
		  select Tab1.item_description, Tab2.Product
		  from [Brands].[dbo].[ITEMS_Table] Tab1 
		  cross join
		  [Products].[dbo].[PRODUCT_Table] Tab2
		  where Gross_Sales = 13320.00

		  select Tab1.item_description, Tab2.Product,Gross_Sales
		  from [Brands].[dbo].[ITEMS_Table] Tab1 
		  cross join
		  [Products].[dbo].[PRODUCT_Table] Tab2
		  where Gross_Sales = 13320.00


/*4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2*/




	
Alter table ITEMS_Table
ADD Item_desc1 VARCHAR(100),
    Item_desc2 VARCHAR(100)


UPDATE ITEMS_Table
SET Item_desc1 = SUBSTRING(item_description, 1, CHARINDEX(' ', item_description) - 1),
    Item_desc2 = SUBSTRING(item_description, CHARINDEX(' ', item_description) + 1, LEN(item_description) - CHARINDEX(' ', item_description));

SELECT * FROM ITEMS_Table;
