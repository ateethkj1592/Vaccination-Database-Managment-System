Drop table CITIZEN cascade constraint;
Drop table LOCATION cascade constraint;
Drop table VACCINATION_CENTER cascade constraint;
Drop table HEALTHCARE_WORKER cascade constraint;
Drop table VACCINE cascade constraint;
Drop table VACCIN_RECORD cascade constraint;
CREATE TABLE CITIZEN(
 AADHAR_NUMBER NUMBER(12) PRIMARY KEY,
 NAME VARCHAR(50),
 DOB DATE,
 GENDER VARCHAR(1),
 PINCODE NUMBER,
 FOREIGN KEY(PINCODE) REFERENCES LOCATION(PINCODE)
 );
 INSERT INTO CITIZEN VALUES(432156781111,'Mahesh','01-01-1990','M',360021);
 INSERT INTO CITIZEN VALUES(123409082001,'Ramesh','21-01-1990','M',380001);
 INSERT INTO CITIZEN VALUES(442156781441,'Suresh','01-11-2000','M',226001);
 INSERT INTO CITIZEN VALUES(452156781451,'Yogesh','01-01-1990','M',506002);
 INSERT INTO CITIZEN VALUES(462156781461,'Jayesh','01-01-1995','M',360001);
 INSERT INTO CITIZEN VALUES(472156781471,'Aadhesh','30-01-2001','M',324006);
 INSERT INTO CITIZEN VALUES(433454781441,'Amrita','05-01-1999','F',302003);
 INSERT INTO CITIZEN VALUES(431256781121,'Shivani','01-04-1970','F',110001);
 INSERT INTO CITIZEN VALUES(432256782221,'Shivansh','21-11-1989','M',410209);
 INSERT INTO CITIZEN VALUES(432126281111,'Alexi','21-2-2001','F',500005);
 INSERT INTO CITIZEN VALUES(124356781111,'Pooja','22-11-2004','F',560002);
 
 
 CREATE TABLE LOCATION(
   PINCODE NUMBER PRIMARY KEY,
   CITY VARCHAR(20),
   STATE VARCHAR(30)
   );
   INSERT INTO LOCATION VALUES(362001,'Junagadh','Gujarat');
   INSERT INTO LOCATION VALUES(380001,'Ahmedabad','Gujarat');
   INSERT INTO LOCATION VALUES(226001,'Lucknow','UP');
   INSERT INTO LOCATION VALUES(506002,'Warangal','Telangana');
   INSERT INTO LOCATION VALUES(360001,'Rajkot','Gujarat');
   INSERT INTO LOCATION VALUES(324006,'Kota','Rajasthan');
   INSERT INTO LOCATION VALUES(302003,'Jaipur','Rajasthan');
   INSERT INTO LOCATION VALUES(110001,'Delhi','Delhi');
   INSERT INTO LOCATION VALUES(410206,'New Mumbai','Maharashtra');
   INSERT INTO LOCATION VALUES(500005,'Hyderabad','Telangana');
   INSERT INTO LOCATION VALUES(560002,'Bangalore','Karnataka');
   
 CREATE TABLE VACCINATION_CENTER(
  CENTER_ID VARCHAR(5) PRIMARY KEY,
  LOC_NAME VARCHAR(30),
  PINCODE NUMBER,
  FOREIGN KEY(PINCODE)REFERENCES LOCATION(PINCODE)
  );
INSERT INTO VACCINATION_CENTER values('C1301','Laxminagar Soc.',362001);
INSERT INTO VACCINATION_CENTER values('C1302','talav Street',380001);
INSERT INTO VACCINATION_CENTER values('C1303','Railway Station',226001);
INSERT INTO VACCINATION_CENTER values('C1304','Gokul Nagar Soc.',506002);
INSERT INTO VACCINATION_CENTER values('C1201','sabarmati Ashram',360001);
INSERT INTO VACCINATION_CENTER values('C1202','kankaria Lake',324006);
INSERT INTO VACCINATION_CENTER values('C1203','CG Road',302003);
INSERT INTO VACCINATION_CENTER values('C2101','Hasanganj',110001);
INSERT INTO VACCINATION_CENTER values('C2102','Indira Nagar',410206);
INSERT INTO VACCINATION_CENTER values('C2103','Kakori',500005);
INSERT INTO VACCINATION_CENTER values('C5104','Rajendra Nagar',560002);


CREATE TABLE HEALTHCARE_WORKER(
  WORK_ID VARCHAR(4) PRIMARY KEY,
  POST VARCHAR(30),
  CENTER_ID VARCHAR(5),
  AADHAR_NUMBER NUMBER,
  FOREIGN KEY (CENTER_ID) REFERENCES VACCINATION_CENTER(CENTER_ID),
  FOREIGN KEY (AADHAR_NUMBER) REFERENCES CITIZEN(AADHAR_NUMBER)
  );
  INSERT INTO HEALTHCARE_WORKER VALUES(101,'Compounder','C1301',432156781111);
  INSERT INTO HEALTHCARE_WORKER VALUES(201,'Nurse','C1302',123409082001);
  INSERT INTO HEALTHCARE_WORKER VALUES(301,'Compounder','C1303',442156782001);
  INSERT INTO HEALTHCARE_WORKER VALUES(401,'Doctor','C1304',452156781451);
  INSERT INTO HEALTHCARE_WORKER VALUES(501,'Senior Compounde','C1201',462156781461);
  INSERT INTO HEALTHCARE_WORKER VALUES(601,'Compounder','C1202',472156781471);
  INSERT INTO HEALTHCARE_WORKER VALUES(701,'Nurse','C1203',433454781441);
  INSERT INTO HEALTHCARE_WORKER VALUES(801,'Compounder','C2101',431256781121);
  INSERT INTO HEALTHCARE_WORKER VALUES(901,'Compounder','C2102',432256782221);
  INSERT INTO HEALTHCARE_WORKER VALUES(108,'Compounder','C2103',432126281111);
  INSERT INTO HEALTHCARE_WORKER VALUES(118,'Compounder','C5104',124356781111);
CREATE TABLE VACCINE(
 VAC_ID  NUMBER PRIMARY KEY,
 VAC_NAME VARCHAR(30),
 COUNTRY VARCHAR(30)
 );
 INSERT INTO VACCINE VALUES(729579,'CERVICAL CANCER VACCINE','IRAQ');
 INSERT INTO VACCINE VALUES(442737,'CHOLERA VACCINE','BONAIRE');
 INSERT INTO VACCINE VALUES(295381,'COVID 19 VACCINE','CZECHIA');
 INSERT INTO VACCINE VALUES(367852,'DIPHTHERIA VACCINE','ARGENTINA');
 INSERT INTO VACCINE VALUES(310900,'HEPATITIS B VACCINE','CHAD');
 INSERT INTO VACCINE VALUES(185863,'INFLUENZA VACCINE','ALAND ISLANDS');
 INSERT INTO VACCINE VALUES(179703,'JAPANESE ENCCEPHALITIS VACCINE','GERMANY');
 INSERT INTO VACCINE VALUES(396114,'MEASLES VACCINE','PARAGUAY');
 INSERT INTO VACCINE VALUES(860228,'MUMPS VACCINE','MAURITIUS');
 INSERT INTO VACCINE VALUES(155557,'PERTUSSIS VACCINE','BURKINA FASO');
 INSERT INTO VACCINE VALUES(375955,'PNEUMONIA VACCINE','MACEDONIA');
 INSERT INTO VACCINE VALUES(123456,'HFDS VACCINE','Argentina');
 
 CREATE TABLE VACCIN_RECORD(
 REF_ID NUMBER primary key,
 vacc_date DATE ,
 WORK_ID VARCHAR(4),
 CENTER_ID VARCHAR(5),
 VAC_ID NUMBER,
 AADHAR_NUMBER NUMBER,
 FOREIGN KEY (WORK_ID) REFERENCES HEALTHCARE_WORKER(WORK_ID),
 FOREIGN KEY (CENTER_ID) REFERENCES VACCINATION_CENTER(CENTER_ID),
 FOREIGN KEY (VAC_ID) REFERENCES VACCINE(VAC_ID),
 FOREIGN KEY (AADHAR_NUMBER) REFERENCES CITIZEN(AADHAR_NUMBER)
 );
 INSERT INTO VACCIN_RECORD values(111,'01-01-2020',201,'C1302',729579,432126281111);
 INSERT INTO VACCIN_RECORD values(113,'15-09-2019',701,'C1203',375955,433454781441);
 INSERT INTO VACCIN_RECORD values(114,'21-11-2018',401,'C1304',367852,452156781451);
 INSERT INTO VACCIN_RECORD values(115,'25-08-2019',108,'C2103',310900,433454781441);
 INSERT INTO VACCIN_RECORD values(118,'14-11-2020',601,'C1202',295381,472156781471);
 INSERT INTO VACCIN_RECORD values(112,'24-03-2007',801,'C2101',185863,431256781121);
 INSERT INTO VACCIN_RECORD values(116,'17=04-2019',118,'C5104',295381,124356781111);
 INSERT INTO VACCIN_RECORD values(117,'21-10-2020',401,'C1304',310900,452156781451);
 
COMMIT;
SELECT * FROM CITIZEN;
SELECT * FROM LOCATION;
SELECT * FROM VACCINATION_CENTER;
select * from HEALTHCARE_WORKER;
SELECT * FROM VACCINE;
SELECT * FROM VACCIN_RECORD;

1)Retrieve the details of the doctors working in healthcare centers 
Select name,dob,gender
from citizen c,healthcare_worker h
where c.aadhar_number=h.aadhar_number and h.post='Doctor';

2)Retrieve the details of the citizens who have taken covid 19 vaccine
select c.name,c.dob,c.gender 
from citizen c,vaccine v,vaccin_record r
where c.aadhar_number=r.aadhar_number and v.vac_id=r.vac_id and r.vac_id=295381;

3)Retrive the details of healthcare workers who are from Hyderabad
Select c.name,c.dob,c.gender
from citizen c,location l,healthcare_worker h
where c.aadhar_number=h.aadhar_number and c.pincode=l.pincode and l.city='Hyderabad';

4)Retrieve the details of the citizen who are from Gujarat and have taken Pneumonia vaccine
select c.name
from citizen c,location l,vaccine v,vaccin_record r
where c.pincode=l.pincode and l.state='Gujarat' and c.aadhar_number=r.aadhar_number and v.vac_id=r.vac_id and v.vac_id=375995;

5)Retrieve the details of vaccination centers where helathcare workers haven taken any vaccine
Select v.center_id,v.loc_name
from vaccination_center v,healthcare_worker h,vaccin_record r
where h.aadhar_number=r.aadhar_number and r.center_id=v.center_id;


6)Retrieve the helathcare worker who IS NURSE AND who works in center located in Talav street
Select c.name 
from Citizen c,HEALTHCARE_WORKER h
where c.aadhar_number=h.aadhar_number and h.post='Nurse' ; 

7) Count the number of vaccinated citizens who are from either rajasthan or maharasthra
Select count(c.name)
from citizen c,vaccin_record v,location l
where c.aadhar_number=v.aadhar_number and c.pincode=l.pincode and l.state='Rajasthan' or l.state='Maharashtra';

8) Display the name of country which has produced more than 2 vaccines
select COUNTRY,count(*)
from vaccine 
group by country
having count(*)>1;

9) Count the number of female citizens who have taken more than 2 vaccines
select count(c.aadhar_number),c.gender
from citizen c,vaccin_record v
where c.aadhar_number=v.aadhar_number 
group by(gender)
having c.gender='F';

10)Retrive the 4 most recent male citizens who have taken vaccination 
select c.name
from citizen c,vaccin_record v
where c.aadhar_number=v.aadhar_number and c.gender='M';

11)Retrieve the names of the healthcare worker who are born between 2000 to 2005
select c.name
from citizen c,healthcare_worker h
where c.aadhar_number=h.aadhar_number and c.dob between '01-01-2000' and '31-12-2005';

12) Retrieve the name of the vaccination centers located in Rajasthan 
Select center_id,LOC_NAME
from vaccination_center v,location l
where v.pincode=l.pincode and l.state='Rajasthan' ;


13) Retrive the name of the healthcare workers who work in kankaria lake
Select c.name,c.aadhar_number
from citizen c,healthcare_worker h,vaccination_center v
where c.aadhar_number=h.aadhar_number and h.center_id=v.center_id and v.loc_name='kankaria Lake';

14) Retrieve the detials of the citizens who are born between 1990 to 1999
select name,dob,gender,aadhar_number
from citizen
where dob between '01-01-1990' and '31-12-1999';

15)Retrieve the details of vaccination records of the citizen who lives in Karnataka
select v.REF_ID,v.VACC_DATE,v.VAC_ID,v.AADHAR_NUMBER
from citizen c,vaccin_record v,location l
where c.aadhar_number=v.aadhar_number and c.pincode=l.pincode and l.state='Karnataka';

16)Retrieve the details of the citizen who have taken vaccination from female healthcare worker
select c.name,c.dob,c.gender,c.aadhar_number
from citizen c,healthcare_worker h,vaccin_record v
where v.work_id=h.work_id and h.aadhar_number=c.aadhar_number and c.gender='F';



17)Retrieve the details of the healthcare worker who has given any vaccination to any citizen

select c.name,c.dob,c.gender,c.aadhar_number
from citizen c,healthcare_worker h,vaccin_record v
where c.aadhar_number=h.aadhar_number and h.work_id=v.work_id;


18)Retrive the details of citizen who have taken Influenza vaccine
select c.name,c.dob,c.gender,c.aadhar_number
from citizen c,vaccine v,vaccin_record r
where c.aadhar_number=r.aadhar_number and r.vac_id=v.vac_id and v.vac_name='INFLUENZA VACCINE';


19)Retrieve details of the vaccine whose id end with even number
select *
from vaccine 
where vac_id % 2 = 0;

20)Retrieve the total number of compounders who live in Delhi
select count(h.work_id),h.aadhar_number
from citizen c,healthcare_worker h,location l
where c.aadhar_number=h.aadhar_number and c.pincode=l.pincode and h.post='Compounder'and l.city='Delhi'
group by(h.aadhar_number);

21)Retrieve the details of all the h workers along with their post who work in Sabarmati ashram and CG Road

select c.name,c.dob,c.gender,c.aadhar_number,h.post
from citizen c,healthcare_worker h,location l,healthcare_center v
where c.aadhar_number=h.aadhar_number and l.pincode=v.pincode and h.center_id=v.center_id and v.loc_name='sabarmati Ashram';
 
 22) Create view of healthcare workers
 
 create view healthcare_workers as 
 select *
 from healthcare_worker;
 
 select * from healthcare_workers
 
 23)Create view of vaccination centers
 
 create view vaccination_centers as 
 select *
 from vaccination_center;
 
 select * from vaccination_centers;
 
 24) Create view of citizens who name start with letter 'A'
 
 create view citiz_A as 
 select *
 from citizen c
 where c.name like 'A%';
 
 select * from citiz_A;
 
 25)create view for all the available vaccines
 
 create view ava_vacc as
 select *
 from vaccine;
 
 select * from ava_vacc;