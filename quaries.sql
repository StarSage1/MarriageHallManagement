#Calculating total price for client
Select price*1.2 as 'price with tax' from mhall;

SELECT concat(fname,' ',lname) as 'Full Name', address 
	FROM Cclient;
    
#Calculating Client Age    
Select concat(fname,' ',lname) as 'Full Name', year(curdate())-year(bdate) as Age
	FROM Cclient;
    
#Calculating Admin Age 
Select concat(fname,' ',lname) as 'Full Name', year(curdate())-year(bdate) as Age
	FROM Aadmin;
 
#Getting most expensive hall
Select hall_name as 'Hall Name', max(price) as 'Most Expensive Hall'
   FROM mhall group by hall_name;
   
#Getting smallest number of capacity of hall
Select hall_name, hall_code, min(capacity) as 'Smallest Hall'
   FROM mhall group by hall_code;
 
 #Inner join location & hall name
Select hallloc.location as 'Location', mhall.hall_name as 'Hall Name'
   FROM mhall inner join hallloc
   WHERE mhall.hall_code = hallloc.hnum;
   
#Inner join phonenumber & client name
Select phonenum.mobile as 'Phonenumber', cclient.c_id as 'ID'
    FROM cclient inner join phonenum 
    WHERE phonenum.p_id = cclient.c_id;
   
#Printing Hall table
Select * 
   FROM mhall;
   
#Sort hall table from most expensive to cheapest
Select hall_name as 'Hall Name', price as 'Price without tax'
   FROM mhall 
     order by price desc;
     
#Data displayed after booking
SELECT cclient.c_id as 'ID', bookinglist.b_date as 'Registration Date', price*1.2 as 'Total Price'
	FROM cclient 
	 join bookinglist
		ON cclient.c_id = bookinglist.client_id
	 JOIN mhall 
		 ON mhall.hall_code =  bookinglist.hall_id;
         
#Display admins having salary > average salary
Create view SAA as 
    SELECT concat(fname,' ',lname) as 'Full Name',Salary
	FROM aadmin 
        WHERE salary > ( Select avg(salary) FROM aadmin);
        
Select * FROM SAA;

	
#Delete admins having salary less than 3800
Delete 
   FROM aadmin
     WHERE salary < 3800;
     
#Update payment status of a certian reservation   
UPDATE Payment 
   SET statues = 'Paid' 
     Where id_p = '2273B';
     
#Update the whole payment table to be paid  
Update Payment 
    SET statues = 'Paid';   
 
#Delete all the old reservations
Delete 
    FROM bookinglist
      WHERE b_date < curdate();
     
Select distinct location 
     FROM hallloc;