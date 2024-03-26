create database bdm_proj;
use bdm_proj;

create table `User`(
User_ID int not null, 
Email varchar(30) not null, 
`First` char(10) not null, 
Middle char(10) not null, 
`Last` char(10) not null, 
Registration date not null,
Gender char(1) not null,
Street varchar(30) not null,
City char(20) not null, 
Zip char(6) not null, 
constraint User_pk primary key(User_ID)
); 

create table Delivery(
Delivery_ID int,
Company char(30),
constraint Delivery_pk primary key(Delivery_ID)
); 


create table Product(
Product_ID varchar(16) not null, 
Brand varchar(28) not null, 
Colour char(15), 
Product_Condition varchar(12), 
Price decimal(6,2) not null, 
Product_Type char(8) not null,
constraint Product_pk primary key(Product_ID)
);

create table Product_Material(
Product_ID varchar(16) not null, 
Material varchar(25) not null, 
constraint Product_material_pk primary key(Product_ID, Material),
constraint Product_material_fk foreign key(Product_ID) references Product(Product_ID)
); 

create table Product_Pattern(
Product_ID varchar(16) not null, 
Pattern char(10) not null,
constraint Product_pattern_pk primary key(Product_ID, Pattern),
constraint Product_pattern_fk foreign key(Product_ID) references Product(Product_ID)
); 

create table Review(
User_ID int not null, 
Product_ID varchar(16) not null,  
Review_ID int not null,
Ratings int not null, 
Order_ID varchar(5) not null,
constraint Review_pk primary key(Review_ID),
constraint Review_fk_1 foreign key(User_ID) references `User`(User_ID),
constraint Review_fk_2 foreign key(Product_ID) references Product(Product_ID)
); 


create table `Order`(
Order_ID varchar(5) not null,
Payment_Method char(10) not null, 
Delivery_ID int not null, 
User_ID int not null, 
`Status` char(10) not null, 
Delivery_Date date not null,
constraint Order_pk primary key(Order_ID),
constraint Order_fk1 foreign key(User_ID) references `User`(User_ID),
constraint Order_fk2 foreign key(Delivery_ID) references Delivery(Delivery_ID)
);

create table Order_Product(
Order_ID varchar(5) not null,
Quantity int not null,
Discount decimal(3,2),
Product_ID varchar(16) not null,
constraint Order_Product_pk primary key(Order_ID, Product_ID),
constraint Order_Product_fk1 foreign key(Order_ID) references `Order`(Order_ID),
constraint Order_Product_fk2 foreign key(Product_ID) references Product(Product_ID)
);

create table Clothing(
C_Product_ID varchar(16) not null, 
Style varchar(15) not null, 
Size_Range varchar(15) not null, 
Category varchar(6) not null,
constraint Clothing_pk primary key(C_Product_ID),
constraint Clothing_fk foreign key(C_Product_ID) references Product(Product_ID)
);

create table Beauty(
B_Product_ID varchar(16) not null, 
Purpose varchar(20) not null, 
Main_Ingredient varchar(30) not null,
Concerns char(40),
constraint Beauty_pk primary key(B_Product_ID),
constraint Beauty_fk foreign key(B_Product_ID) references Product(Product_ID)
);

create table Purchase_History(
User_ID int not null,
Date_of_Purchase date not null, 
Order_ID varchar(5) not null, 
constraint Purchase_History_pk primary key(User_ID, Order_ID),
constraint Purchase_History_fk_1 foreign key(User_ID) references `User`(User_ID),
constraint Purchase_History_fk_2 foreign key(Order_ID) references `Order`(Order_ID)
);

#insert data 
Insert into `User` Values (101, 'songjia@outlook.com', 'Song', 'Ji', 'A', '2018-01-01', 'F', '36 Defu Lane 9', 'Singapore', '160092'),
(102, 'xihao@gmail.com', 'Lim', 'Xi', 'Hao', '2018-02-01', 'M', '39 Genting Lane', 'Singapore', '349554'),
(103, 'linting@yahoo.com', 'Kong', 'Lin', 'Ting', '2019-11-03', 'F', '14 Hougang Avenue 7', 'Singapore', '569844'),
(104, 'ericwei@gmail.com', 'Wei', 'Eric', 'Tan', '2019-03-20', 'F', '93 Tampines Street ', 'Singapore', '528845'),
(105, 'ruirui@hotmail.com', 'Oh', 'Rui ', 'Rui', '2019-03-21', 'F', '6 Wiltshire Road', 'Singapore', '466382'),
(106, 'ziwenoh@gmail.com', 'Oh ', 'Zi ', 'Wen', '2020-04-01', 'M', '10 Ubi Crescent', 'Singapore', '408564'),
(107, 'ilovebdm@yahoo.com', 'Tan ', 'Goofy', 'Nikki', '2021-02-19', 'F', '123 Genting Lane', 'Singapore', '349574'),
(108, 'zixi01@outlook.com', 'Lim', 'Zi ', 'Xi', '2021-09-28', 'M', '1 Turf Club Avenue', 'Singapore', '738078'),
(109, 'burdeneeting@yahoo.com', 'En', 'Ee', 'Ting', '2021-12-31', 'M', '2 Jalan Rajah', 'Singapore', '329134'),
(110, 'jinsonnie@gmail.com', 'Jin', 'Sonnie', 'Tan', '2022-03-03', 'F', '10 Jalan Besar', 'Singapore', '650385');

insert into Delivery values (1001, 'Yamato Transport Singapore'), 
(1002, 'SingPost'), 
(1003, 'NinjaVan'), 
(1004, 'S.F. Express Singapore'), 
(1005, 'Janio Asia'),
(1006, 'Zi Hao Sends it'),
(1007, 'Wen lin Brings around'),
(1008,	'Eetings expresso'),
(1009, 'Kwong Mobile'),
(1010,	'Song Dong Xi');

Insert into Product Values ('E851EAA0A5C7C2GS', 'H&M', 'Beige' , NULL , 6.95, 'Clothing'),
('BE184AAA4C9DE0GS', 'Twenty Eight Shoes', 'Green' , NULL , 55.0, 'Clothing'),
('ABB8EBE1A7F605GS', 'SK-II', NULL , 'Brand New', 115.0, 'Beauty'),
('C3240AA43C376CGS', 'Twenty Eight Shoes', 'Beige' , NULL , 97.0, 'Clothing'),
('5E0FEAAA03F5B2GS', 'Li-Ning', 'White' , 'Brand New', 60.0, 'Clothing'),
('F86FBAAFBF8695GS', 'ADIDAS', 'Green' , NULL , 140.0, 'Clothing'),
('10AC1AAE0951F2GS', 'BOSS', 'Blue' , NULL , 359.0, 'Clothing'),
('39AD5AAE88115DGS', 'MANGO Man', 'White' , NULL , 65.9, 'Clothing'),
('30C95USF660E68GS', 'Twenty Eight Shoes', 'Black' , NULL , 88.0, 'Clothing'),
('08FCDAAFBEE489GS', 'Under Armour', 'Purple' , NULL , 79.0, 'Clothing'),
('0011BUS8E4B38EGS', 'Abercrombie & Fitch', 'Black' , NULL , 70.0, 'Clothing'),
('5C55EBEF1FED61GS', 'Prada', NULL , NULL, 132.0, 'Beauty'),
('C25E4BE80113C9GS', 'Clinique', NULL , NULL, 97.0, 'Beauty'),
('8201EBED410D75GS', 'Fresh', NULL , NULL, 31.0, 'Beauty'),
('D5AB6BE57BB295GS', 'Clinique', NULL , 'Brand New', 42.0, 'Beauty'),
('11DC0BED0F0101GS', 'Versace', NULL , NULL, 92.0, 'Beauty'),
('D02DABEADF39DDGS', 'Botanist', NULL , NULL, 76.0, 'Beauty'),
('D914CBEF814695GS', 'Marc jacob Fragrances', NULL , 'Brand New', 166.0, 'Beauty'),
('70A5ABEF266A58GS', 'BOURJOIS', 'Translucent' , NULL , 29.9, 'Beauty'),
('D00A3BE1D90CD7GS', 'BOURJOIS', 'Beige' , NULL , 19.5, 'Beauty'),
('DC1D6KA5446CBCGS', 'Moschnino', 'Grey' , 'Brand New', 439.0, 'Clothing'),
('35FD2KA4EB0DECGS', 'Sleep No More', 'White' , NULL , 39.0, 'Clothing'),
('4EE37KAF706FD6GS', 'Dsquared2', 'Grey' , 'Brand New', 87.0, 'Clothing'),
('2FBF9KA26E05DEGS', 'Nike', 'Smoke Grey' , 'Brand New', 29.0, 'Clothing'),
('283CAKADAE19A2GS', 'Sleep No More', 'White' , 'Brand New', 38.0, 'Clothing');

Insert into Product_Material Values ('E851EAA0A5C7C2GS', '100% Cotton'),
('BE184AAA4C9DE0GS', '50% Viscose'),
('BE184AAA4C9DE0GS', '22% Nylon'),
('BE184AAA4C9DE0GS', '28% PBT'),
('C3240AA43C376CGS', '100% Polyester'),
('5E0FEAAA03F5B2GS', '100% Cotton'),
('F86FBAAFBF8695GS', 'Recycled Polyester'),
('10AC1AAE0951F2GS', 'Cotton Blend'),
('39AD5AAE88115DGS', '99% Cotton'),
('39AD5AAE88115DGS', '1% Elastane'),
('30C95USF660E68GS', 'Nylon'),
('08FCDAAFBEE489GS', '87% Polyester'),
('08FCDAAFBEE489GS', '13% Elastane'),
('0011BUS8E4B38EGS', '100% Cotton'),
('DC1D6KA5446CBCGS', '95% Cotton'),
('283CAKADAE19A2GS', '100% organic cotton'),
('35FD2KA4EB0DECGS', '100% organic cotton'),
('4EE37KAF706FD6GS', '100% Cotton'),
('2FBF9KA26E05DEGS', '100% organic cotton');

Insert into Product_Pattern Values ('E851EAA0A5C7C2GS', 'Solid'),
('BE184AAA4C9DE0GS', 'Solid'),
('5E0FEAAA03F5B2GS', 'Solid'),
('F86FBAAFBF8695GS', 'Solid'),
('10AC1AAE0951F2GS', 'Solid'),
('39AD5AAE88115DGS', 'Solid'),
('08FCDAAFBEE489GS', 'Solid'),
('0011BUS8E4B38EGS', 'Solid'),
('30C95USF660E68GS','Checkered'),
('2FBF9KA26E05DEGS','Solid'),
('0011BUS8E4B38EGS', 'Checkered');

Insert into Review Values (101, '70A5ABEF266A58GS', '23904065' , 5, 'A0001'),
(102, '283CAKADAE19A2GS', '23904066' , 5, 'B0001'),
(102, 'D5AB6BE57BB295GS', '23904068' , 1, 'C0001'),
(102, '4EE37KAF706FD6GS', '23904067' , 2, 'D1001'),
(102, 'F86FBAAFBF8695GS', '23904069' , 4, 'D1002'),
(105, 'C3240AA43C376CGS', '23904070' , 5, 'D1003'),
(105, 'F86FBAAFBF8695GS', '23904071' , 5, 'D1003'),
(106, 'E851EAA0A5C7C2GS', '23904072' , 4, 'D1004'),
(103, '30C95USF660E68GS', '23904073' , 2, 'E0001'),
(104, 'DC1D6KA5446CBCGS', '23904074' , 3, 'C0003'),
(106, 'D5AB6BE57BB295GS', '23904075' , 2, 'E0002'),
(106, '11DC0BED0F0101GS', '23904076' , 5, 'E0002'),
(106, '35FD2KA4EB0DECGS', '23904077' , 5, 'E0002'),
(107, '4EE37KAF706FD6GS', '23904078' , 1, 'E0003'),
(107, '08FCDAAFBEE489GS', '23904079' , 3, 'E0004'),
(107, '2FBF9KA26E05DEGS', '23904080' , 4, 'E0005'),
(108, '0011BUS8E4B38EGS', '23904081' , 4, 'F0001'),
(108, 'E851EAA0A5C7C2GS', '23904082' , 3, 'F0002');

Insert into `Order` Values ('A0001', 'Visa', 1002, 101, 'Shipping', '2018-01-18'),
('A0002', 'Mastercard', 1003, 102, 'Shipping', '2018-02-22'),
('B0001', 'Mastercard', 1005, 102, 'Shipping', '2019-05-01'),
('C0001', 'Cash', 1004, 102, 'Shipping', '2020-02-12'),
('C0002', 'Visa', 1005, 102, 'Packing', '2022-01-04'),
('D1001', 'Mastercard', 1003, 102, 'Packing', '2022-03-22'),
('D1002', 'Visa', 1002, 102, 'Packing', '2022-03-22'),
('D1003', 'Cash', 1005, 105, 'Packing', '2019-09-27'),
('D1004', 'Mastercard', 1005, 106, 'Packing', '2020-06-01'),
('B0002', 'GrabPay', 1001, 103, 'Shipping', '2019-12-19'),
('E0001', 'GrabPay', 1001, 103, 'Completed', '2020-06-27'),
('C0003', 'Cash', 1005, 104, 'Packing', '2019-04-12'),
('E0002', 'Visa', 1001, 106, 'Completed', '2021-01-18'),
('E0003', 'Visa', 1002, 107, 'Completed', '2021-03-08'),
('E0004', 'Cash', 1004, 107, 'Completed', '2021-11-19'),
('E0005', 'GrabPay', 1003, 107, 'Completed', '2022-02-03'),
('F0001', 'Visa', 1003, 108, 'Packing', '2021-10-14'),
('F0002', 'Visa', 1002, 108, 'Packing', '2022-01-15');

Insert into Order_Product Values ('A0001', 1, 0.25, '70A5ABEF266A58GS'),
('A0002', 1, 0.45, '10AC1AAE0951F2GS'),
('B0001', 1, NULL, '283CAKADAE19A2GS'),
('C0001', 1, 0.1, 'D5AB6BE57BB295GS'),
('C0002', 1, 0.05, '0011BUS8E4B38EGS'),
('D1001', 1, 0.1, '4EE37KAF706FD6GS'),
('D1002', 1, 0.05, 'F86FBAAFBF8695GS'),
('D1003', 1, NULL, 'C3240AA43C376CGS'),
('D1003', 2, NULL, 'F86FBAAFBF8695GS'),
('D1004', 1, 0.1, 'E851EAA0A5C7C2GS'),
('B0002', 1, NULL, '5E0FEAAA03F5B2GS'),
('B0002', 1, NULL, '39AD5AAE88115DGS'),
('E0001', 2, NULL, '30C95USF660E68GS'),
('C0003', 1, NULL, 'DC1D6KA5446CBCGS'),
('E0002', 3, 0.1, 'D5AB6BE57BB295GS'),
('E0002', 1, NULL, '11DC0BED0F0101GS'),
('E0002', 2, NULL, '35FD2KA4EB0DECGS'),
('E0003', 1, NULL, '4EE37KAF706FD6GS'),
('E0004', 1, NULL, '08FCDAAFBEE489GS'),
('E0005', 1, NULL, '2FBF9KA26E05DEGS'),
('F0001', 1, NULL, '0011BUS8E4B38EGS'),
('F0002', 1, NULL, 'E851EAA0A5C7C2GS');


Insert into Clothing Values 
('E851EAA0A5C7C2GS', 'Casual', 'XS-L', 'Adults'),
('BE184AAA4C9DE0GS', 'Casual', 'XS-XL', 'Adults'),
('C3240AA43C376CGS', 'Formal Wear', 'UK2-UK15', 'Adults'),
('5E0FEAAA03F5B2GS', 'Smart Casual', 'S-XL', 'Adults'),
('F86FBAAFBF8695GS', 'Casual', 'S-L', 'Adults'),
('10AC1AAE0951F2GS', 'Formal Wear', 'S-XL', 'Adults'),
('39AD5AAE88115DGS', 'Casual', 'EU 36-33', 'Adults'),
('30C95USF660E68GS', 'Beachwear', 'M-XXXXL', 'Adults'),
('08FCDAAFBEE489GS', 'Active Wear', 'XS-L', 'Adults'),
('0011BUS8E4B38EGS', 'Beachwear', 'XS-L', 'Adults'),
('DC1D6KA5446CBCGS', 'Smart Casual', 'UK2-UK15', 'Kids'),
('283CAKADAE19A2GS', 'Beachwear', '4-6 years old', 'Kids'),
('35FD2KA4EB0DECGS', 'Casual', '2-6 years old', 'Kids'),
('4EE37KAF706FD6GS', 'Casual', '4-16 years old', 'Kids'),
('2FBF9KA26E05DEGS', 'Active Wear', 'XS-L', 'Kids');



Insert into Beauty Values 
('ABB8EBE1A7F605GS', 'Sun Screen', 'Pitera', NULL),
('5C55EBEF1FED61GS', 'Perfume', 'Benzoin', NULL),
('C25E4BE80113C9GS', 'Serum Foundation', 'Oil-Free Formula', 'Not suitable for sensitive skin'),
('8201EBED410D75GS', 'Soap', 'Pure Vegetable Oil', NULL),
('D5AB6BE57BB295GS', 'Foam Cleanser', 'Glycerine', NULL),
('11DC0BED0F0101GS', 'Perfume', 'Granny Smith apple', NULL),
('D02DABEADF39DDGS', 'Hair Care', 'Lemongrass leaf', 'Recommended for those with soft hair'),
('D914CBEF814695GS', 'Perfume', 'Cashmere Musks', NULL),
('70A5ABEF266A58GS', 'Powder Foundation', 'Java Rice Powder', 'Not suitable for sensitive skin'),
('D00A3BE1D90CD7GS', 'Concealer', 'Glycerine', NULL);

Insert into Purchase_History Values (101, '2018-01-03', 'A0001'),
(102, '2018-02-03', 'A0002'),(102, '2019-04-19', 'B0001'),
(102, '2020-01-20', 'C0001'),(102, '2021-12-21', 'C0002'),
(102, '2022-03-03', 'D1001'),(102, '2022-03-03', 'D1002'),
(103, '2019-12-03', 'B0002'),(103, '2020-06-18', 'E0001'),
(104, '2019-03-27', 'C0003'),(105, '2019-09-12', 'D1003'),
(106, '2020-05-13', 'D1004'),(106, '2020-12-28', 'E0002'),
(107, '2021-02-19', 'E0003'),(107, '2021-11-03', 'E0004'),
(107, '2022-01-17', 'E0005'),(108, '2021-10-01', 'F0001'),
(108, '2021-12-30', 'F0002');

#queries 
#q1

select p.brand, p.product_type, AVG(rd.ratings) as average_ratings
from product p
inner join review rd				
on p.product_id = rd.product_id				
group by p.brand				
order by average_ratings desc;	

#q2
select pm.material, count(distinct p.product_id) as num from product_material pm, product p						
where p.product_id = pm.product_id and pm.material like "%cotton%"						
group by material;							

#q3
select payment_method, count(order_id) as number	
from `order`	
where order_id in 	
(	
select op.order_id	
from product p 	
join order_product op 	
on p.product_id = op.product_id	
where p.price*(1-ifnull(op.discount,0))*op.quantity > 50	
)	
group by payment_method	
order by number DESC;	

#q4
select month(date_of_purchase) as date_month, count(case p.product_type when "clothing" then 1 else null end) as no_of_clothing, count(case p.product_type when "beauty" then 1 else null end) as no_of_beauty, count(p.product_id) as total					
from purchase_history ph					
inner join order_product op on ph.order_id = op.order_id					
inner join product p on op.product_id = p.product_id					
group by date_month					
order by date_month;					

#q5
select d.product_type, u.gender, count(u.gender) as no_per_gender_purchased, count(u.gender) / sum(count(u.gender)) over() as proportion 
from `user` u
inner join `order` o on o.user_id  = u.user_id
inner join order_product p on p.order_id = o.order_id
inner join product d on d.product_id = p.product_id
group by u.gender, d.product_type
order by u.gender
;

#q6

select d.Company, AVG(DATEDIFF(o.Delivery_Date,p.Date_of_Purchase)) as difference_days
from Delivery d,`Order` o,Purchase_History p 
where o.Order_ID=p.Order_ID 
and o.Delivery_ID=d.Delivery_ID
GROUP BY d.Company
ORDER BY difference_days desc;
