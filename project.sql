DROP database if exists hallmarriage;
Create database HallMarriage;
Use HallMarriage;
Create table Cclient(
      ssn        varchar(9) not null primary key,
      fname      text not null,
      lname      text not null,
      bdate      date,
	  sex        enum('Male','Female'),
      address    text NOT NULL,
      email      text NOT NULL,
      c_password text NOT NULL,
      c_id       int,
      UNIQUE (c_id)
);
Create table phonenum(
	  mobile varchar(20) primary key,
      p_id   int ,
      CONSTRAINT fk_phone foreign key (p_id) references Cclient(c_id) ON UPDATE CASCADE ON DELETE CASCADE
);

Create table MHall(
	  hall_code     varchar(100) NOT NULL,
	  hall_name     text NOT NULL,
      price         float NOT NULL DEFAULT 0,
      h_description text NOT NULL,
      capacity      int NOT NULL,
      primary key (hall_code)
);

Create table HallLoc(
       hnum      varchar(100) NOT NULL primary key,
       location  text NOT NULL,
       CONSTRAINT foreign key (hnum) references MHall(hall_code) ON UPDATE CASCADE ON DELETE CASCADE
);


Create table Aadmin( 
      ssn        varchar(9) not null,
      fname      text not null,
      lname      text not null,
      salary     float not null,
      bdate      date,
	  sex        varchar(100),
      address    text NOT NULL,
      email      text NOT NULL,
      a_password text NOT NULL,
      a_id       int,
      CONSTRAINT pk_Admin primary key (ssn),
      UNIQUE (a_id)
);
Create table bookinglist(
       b_code     varchar(100) NOT NULL primary key,
       hall_id    varchar(100) NOT NULL,
       client_id  int,
       b_date     date
);
Create table Payment(
        id_p    varchar(100) NOT NULL primary key,
        statues ENUM('Paid','Unpaid'),
        typep   ENUM('Visa','Cash','Fawry'),
        CONSTRAINT foreign key (id_p) references bookinglist(b_code) on delete cascade );

Create table adminbook(
          b_code2     varchar(100),
          ssn2       varchar(9),
          CONSTRAINT foreign key (b_code2) references bookinglist(b_code) ON UPDATE CASCADE ON DELETE CASCADE,
          CONSTRAINT foreign key (ssn2) references aadmin(ssn) ON UPDATE CASCADE ON DELETE CASCADE
);
Create table adminhall(
		  ssn2       varchar(9), 
		  hall_code2     varchar(100),
		  CONSTRAINT foreign key (hall_code2) references mhall(hall_code) ON UPDATE CASCADE ON DELETE CASCADE,
          CONSTRAINT foreign key (ssn2) references aadmin(ssn) ON UPDATE CASCADE ON DELETE CASCADE
);

 Alter table bookinglist 
ADD CONSTRAINT fk_bookc foreign key (client_id) references Cclient(c_id) ON UPDATE CASCADE;
Alter table bookinglist
ADD CONSTRAINT fk_bookh foreign key (hall_id) references MHall(hall_code) ON UPDATE CASCADE;  



INSERT INTO CCLIENT VALUES('112233445','Laila','Wahba','2001-09-11','Female','42 tayran st.','nanasoliman@gmail','poohpooh','1910');
INSERT INTO CCLIENT VALUES('334455667','Bella','Hadid','2000-06-11','Female','42 tayran st.','bell_hadid@gmail','poohpo222','1911'); 
INSERT INTO CCLIENT VALUES('345678901','Andrew','Kamal','2004-07-11','Male','42 tayran st.','nanasoliman@gmail','poohwinnie','1912'); 
INSERT INTO CCLIENT VALUES('123456789','Ramy','Ahmed','2001-09-11','Male','42 tayran st.','nanasoliman@gmail','winniepooh','1913'); 
INSERT INTO CCLIENT VALUES('657483921','Dareen','Yehia','2001-09-11','Female','42 tayran st.','nanasoliman@gmail','cinderladress','1914'); 
INSERT INTO CCLIENT VALUES('849203748','Mariam','Wahba','2001-09-11','Female','42 tayran st.','nanasoliman@gmail','poohpooh','1915'); 
INSERT INTO CCLIENT VALUES('647383638','Hassan','Wahba','2001-09-11','Male','42 tayran st.','nanasoliman@gmail','poohpooh','1916'); 
INSERT INTO CCLIENT VALUES('985048958','John','Wahba','2001-09-11','Male','42 tayran st.','nanasoliman@gmail','poohpooh','1917'); 
INSERT INTO CCLIENT VALUES('950473655','Rokaya','Wahba','2001-09-11','Female','42 tayran st.','nanasoliman@gmail','poohpooh','1918'); 
INSERT INTO CCLIENT VALUES('102836484','Leil','Wahba','2001-09-11','Male','42 tayran st.','nanasoliman@gmail','poohpooh','1919');

INSERT INTO PHONENUM VALUES('0122348029','1910');
INSERT INTO PHONENUM VALUES('0100140213','1910');
INSERT INTO PHONENUM VALUES('0112345678','1911');
INSERT INTO PHONENUM VALUES('0106667234','1912');
INSERT INTO PHONENUM VALUES('0100000222','1913');
INSERT INTO PHONENUM VALUES('0123455620','1914');
INSERT INTO PHONENUM VALUES('0126747389','1915');
INSERT INTO PHONENUM VALUES('0117474673','1916');
INSERT INTO PHONENUM VALUES('0158373837','1917');
INSERT INTO PHONENUM VALUES('0113673847','1918');
INSERT INTO PHONENUM VALUES('0122348022','1919');
 
INSERT INTO AADMIN VALUES ('647384951','John','Ran','3000','1993-11-13','Male','Hagwards','john@yahoo','liamliam','9900');
INSERT INTO AADMIN VALUES ('647384952','omar','ezzat','3500','1994-10-15','Male','sheraon','john@gmail','lo2lo2','9901');
INSERT INTO AADMIN VALUES ('647384953','omariko','ezzo','4000','1997-05-19','Male','sheraton','john@hotmale','so2so2','9902');
INSERT INTO AADMIN VALUES ('647384954','nermine','soliman','3800','2002-03-03','female','madinetn nasr','john@icloud','toptop','9903');
INSERT INTO AADMIN VALUES ('647384955','nermine','soly','5000','1986-11-13','female','wall street','omarezzat93@gmail','botbot','9904');
INSERT INTO AADMIN VALUES ('647384956','rawan','Ran','5500','1993-11-13','female','tagamo3','omarezzat93@yahoo','omariko','9905');
INSERT INTO AADMIN VALUES ('647384957','rawan','soso','3000','1993-11-13','female','tagamo3','omarezzat93@hotmail','omoura','9906');
INSERT INTO AADMIN VALUES ('647384958','tata','nono','4500','1993-11-13','Male','mokatam','john@yahoo','lollol','9907');
INSERT INTO AADMIN VALUES ('647384959','3amoura','lolo','4200','1993-11-13','Male','LA','john@yahoo','to2to2','9908');
INSERT INTO AADMIN VALUES ('647384960','zoza','Ran','3900','1993-11-13','female','Hagwards','john@yahoo','zo2zo2','9910');


INSERT INTO MHALL VALUES('1a','NATACHA','20000','GARDEN & POOL','150');
INSERT INTO MHALL VALUES('2a','UP-HILLS','35000','ROOF-TOP','200');
INSERT INTO MHALL VALUES('3a','TANGLED','25000','GARDEN & POOL','170');
INSERT INTO MHALL VALUES('1b','lo2lo2a','20000','POOL','150');
INSERT INTO MHALL VALUES('2b','gawhara','33000','ROOF-TOP','250');
INSERT INTO MHALL VALUES('3b','al amira','100000','closed','300');
INSERT INTO MHALL VALUES('1c','NATACHA','25000','GARDEN & POOL','150');
INSERT INTO MHALL VALUES('2c','UP-HILLS','10000','open-air','200');
INSERT INTO MHALL VALUES('3c','tamara','25000','GARDEN & POOL','170');
INSERT INTO MHALL VALUES('3d','TANGLED','26000','GARDEN','170');

INSERT INTO HALLLOC VALUES('1a','Zamalek');
INSERT INTO HALLLOC VALUES('2a','NasrCity');
INSERT INTO HALLLOC VALUES('3a','Mokataam');
INSERT INTO HALLLOC VALUES('1b','Zamalek');
INSERT INTO HALLLOC VALUES('2b','NasrCity');
INSERT INTO HALLLOC VALUES('3b','Mokataam');
INSERT INTO HALLLOC VALUES('1c','Zamalek');
INSERT INTO HALLLOC VALUES('2c','NasrCity');
INSERT INTO HALLLOC VALUES('3c','Mokataam');
INSERT INTO HALLLOC VALUES('3d','Zamalek');

INSERT INTO BOOKINGLIST VALUES ('2273A','1a','1910','2023-01-01');
INSERT INTO BOOKINGLIST VALUES ('2273B','1b','1916','2023-09-01');
INSERT INTO BOOKINGLIST VALUES ('2273C','1c','1912','2023-12-01');
INSERT INTO BOOKINGLIST VALUES ('2273D','2a','1910','2023-05-01');
INSERT INTO BOOKINGLIST VALUES ('2273E','2b','1911','2023-06-01');
INSERT INTO BOOKINGLIST VALUES ('2273F','2c','1912','2023-7-01');
INSERT INTO BOOKINGLIST VALUES ('2273G','3a','1915','2023-10-01');
INSERT INTO BOOKINGLIST VALUES ('2273H','3b','1914','2023-09-05');
INSERT INTO BOOKINGLIST VALUES ('2273I','3c','1917','2023-12-06');
INSERT INTO BOOKINGLIST VALUES ('2273l','3d','1919','2023-09-09');

INSERT INTO PAYMENT VALUES('2273A','Paid','Visa');
INSERT INTO PAYMENT VALUES('2273B','unpaid','Fawry');
INSERT INTO PAYMENT VALUES('2273C','Unpaid','visa');
INSERT INTO PAYMENT VALUES('2273D','Paid','Visa');
INSERT INTO PAYMENT VALUES('2273E','unpaid','cash');
INSERT INTO PAYMENT VALUES('2273F','Unpaid','Fawry');
INSERT INTO PAYMENT VALUES('2273G','Paid','Visa');
INSERT INTO PAYMENT VALUES('2273H','Paid','Fawry');
INSERT INTO PAYMENT VALUES('2273I','Unpaid','cash');
INSERT INTO PAYMENT VALUES('2273L','Paid','Fawry');

