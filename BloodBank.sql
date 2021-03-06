drop table ORDERS;
drop table BLOOD;
drop table hospital;
drop table donor;
drop table BLOODBANK;
drop table BloodBankManager;
drop table RECEPTIONIST;



CREATE TABLE RECEPTIONIST(
    EMPID         NUMBER(4) NOT NULL,
	RNAME         VARCHAR(30),
	RPHONE        VARCHAR(11),
	RADDRESS      VARCHAR(30),
	PRIMARY KEY(EMPID)
);
INSERT INTO RECEPTIONIST VALUES(1,'Saiful Haque','01765343212','Rangpur');
INSERT INTO RECEPTIONIST VALUES(2,'MSK Sarif','01765343235','Tangail');
INSERT INTO RECEPTIONIST VALUES(3,'Topu Muns','01765376453','Munshiganj');

CREATE TABLE BloodBankManager (
    MID         NUMBER(4) NOT NULL,
	MNAME       VARCHAR(30),
    MPHONE   VARCHAR(11),
    EMPID   VARCHAR(50),
	PRIMARY KEY(MID)
);

INSERT INTO BloodBankManager VALUES(1000,'Enamul Karim','0178778545','enamul@gmail.com');
INSERT INTO BloodBankManager VALUES(1001,'Nahid Hasan','01910125428','nahid@gmail.com');
INSERT INTO BloodBankManager VALUES(1002,'Hasan hadi','01982888238','hadi@gmail.com');



CREATE TABLE HOSPITAL(
    HID         NUMBER(10) NOT NULL,
	HNAME       VARCHAR(100),
	HADDRESS    VARCHAR(30),
	HPHONE      VARCHAR(11),
	PRIMARY KEY(HID)
);
INSERT INTO HOSPITAL VALUES(789321,'Munshiganj Medical','Munshiganj','9870987');
INSERT INTO HOSPITAL VALUES(789123,'Narayanganj Medical','Narayanganj','9875679');
INSERT INTO HOSPITAL VALUES(789781,'Sirajganj Medical','Sirajganj','4568763');

CREATE TABLE DONOR(
    DID         NUMBER(4) NOT NULL,
	DNAME      VARCHAR(30),
	GENDER     VARCHAR(10),
	AGE        NUMBER(2),
	DADDRESS     VARCHAR(30),
	PHONE      VARCHAR(11),
	EMP_ID         NUMBER(4),
	PRIMARY KEY(DID),
	FOREIGN KEY (EMP_ID) REFERENCES RECEPTIONIST (EMPID) ON DELETE CASCADE
);
INSERT INTO DONOR VALUES(1,'Nahid Hasan','Male',21,'Munshiganj','01999300320',2);
INSERT INTO DONOR VALUES(2,'hadi','Male',23,'Sirajganj','01999300230',1);
INSERT INTO DONOR VALUES(3,'Zim','Male',24,'Rangpur','01999300367',3);


CREATE TABLE BLOODBANK(
    BNO              NUMBER(4) NOT NULL,
    bBankName       VARCHAR(40),
	BLOODTYPE        VARCHAR(30),
	ORDERS           NUMBER(4),
	MID              NUMBER(4),
    EMPID            NUMBER(4),
	PRIMARY KEY(BNO),
	FOREIGN KEY (MID) REFERENCES BloodBankManager (MID) ON DELETE CASCADE,
	FOREIGN KEY (EMPID) REFERENCES RECEPTIONIST (EMPID) ON DELETE CASCADE
	);

INSERT INTO BLOODBANK VALUES(1,'Daffodil Blood Bank','A+',2,1000,1);
INSERT INTO BLOODBANK VALUES(2,'Popular Blood Bank','B+',4,1000,2);
INSERT INTO BLOODBANK VALUES(3,'Labaid Blood Bank','A+',2,1000,1);



CREATE TABLE BLOOD(
    BCODE         NUMBER(4) NOT NULL,
	BTYPE         VARCHAR(30),
	COST          NUMBER(5),
	D_ID           NUMBER(4),
    B_NO           NUMBER(4) ,
	PRIMARY KEY(BCODE),
	FOREIGN KEY (D_ID) REFERENCES DONOR (DID) ON DELETE CASCADE,
	FOREIGN KEY (B_NO) REFERENCES BLOODBANK (BNO) ON DELETE CASCADE
);
INSERT INTO BLOOD VALUES(111,'A+',350,1,1);
INSERT INTO BLOOD VALUES(112,'B+',350,2,2);
INSERT INTO BLOOD VALUES(113,'AB+',450,3,1);

CREATE TABLE ORDERS(
	B_NO NUMBER(4) NOT NULL,
	HOSPITALID  NUMBER(10) NOT NULL,
	FOREIGN KEY (B_NO) REFERENCES BLOODBANK (BNO) ON DELETE CASCADE,
	FOREIGN KEY (HOSPITALID) REFERENCES HOSPITAL (HID) ON DELETE CASCADE
);

INSERT INTO ORDERS VALUES(2,789321);
INSERT INTO ORDERS VALUES(1,789123);
INSERT INTO ORDERS VALUES(1,789321);

