--<ScriptOptions statementTerminator=";"/>

ALTER TABLE "SALES"."DIMCUSTOMER" DROP CONSTRAINT "DIMCUSTOMER_DIMGEOGRAPHY_FK";

ALTER TABLE "SALES"."DIMEMPLOYEE" DROP CONSTRAINT "DIMEMPLOYEE_DIMEMPLOYEE_FK";

ALTER TABLE "SALES"."DIMEMPLOYEE" DROP CONSTRAINT "DIMEMPLOYEE_DIMSALESTERRITORY_FK";

ALTER TABLE "SALES"."DIMGEOGRAPHY" DROP CONSTRAINT "DIMGEOGRAPHY_DIMSALESTERRITORY_FK";

ALTER TABLE "SALES"."DIMPRODUCT" DROP CONSTRAINT "DIMPRODUCT_DIMPRODUCTSUBCATEGORY_FK";

ALTER TABLE "SALES"."DIMPRODUCTSUBCATEGORY" DROP CONSTRAINT "DIMPRODUCTSUBCATEGORY_DIMPRODUCTCATEGORY_FK";

ALTER TABLE "SALES"."DIMRESELLER" DROP CONSTRAINT "DIMRESELLER_DIMGEOGRAPHY_FK";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMCURRENCY_FK";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMCUSTOMER_FK";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMCUSTOMER_FK1";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK1";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK2";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK3";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK4";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK5";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMPRODUCT_FK";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_DIMPROMOTION_FK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMDATE_FK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMDATE_FK1";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMDATE_FK2";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMEMPLOYEE_FK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMPRODUCT_FK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMPROMOTION_FK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMRESELLER_FK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_DIMSALESTERRITORY_FK";

ALTER TABLE "SALES"."DIMCURRENCY" DROP CONSTRAINT "DIMCURRENCY_PK";

ALTER TABLE "SALES"."DIMCUSTOMER" DROP CONSTRAINT "DIMCUSTOMER_PK";

ALTER TABLE "SALES"."DIMDATE" DROP CONSTRAINT "DIMDATE_PK";

ALTER TABLE "SALES"."DIMEMPLOYEE" DROP CONSTRAINT "DIMEMPLOYEE_PK";

ALTER TABLE "SALES"."DIMGEOGRAPHY" DROP CONSTRAINT "DIMGEOGRAPHY_PK";

ALTER TABLE "SALES"."DIMPRODUCT" DROP CONSTRAINT "DIMPRODUCT_PK";

ALTER TABLE "SALES"."DIMPRODUCTCATEGORY" DROP CONSTRAINT "DIMPRODUCTCATEGORY_PK";

ALTER TABLE "SALES"."DIMPRODUCTSUBCATEGORY" DROP CONSTRAINT "DIMPRODUCTSUBCATEGORY_PK";

ALTER TABLE "SALES"."DIMPROMOTION" DROP CONSTRAINT "DIMPROMOTION_PK";

ALTER TABLE "SALES"."DIMRESELLER" DROP CONSTRAINT "DIMRESELLER_PK";

ALTER TABLE "SALES"."DIMSALESTERRITORY" DROP CONSTRAINT "DIMSALESTERRITORY_PK";

ALTER TABLE "SALES"."FACTINTERNETSALES" DROP CONSTRAINT "FACTINTERNETSALES_PK";

ALTER TABLE "SALES"."FACTRESELLERSALES" DROP CONSTRAINT "FACTRESELLERSALES_PK";

DROP INDEX "SALES"."DIMCURRENCY_AK";

DROP INDEX "SALES"."DIMCUSTOMER_AK";

DROP INDEX "SALES"."DIMDATE_AK";

DROP INDEX "SALES"."DIMEMPLOYEE_AK";

DROP INDEX "SALES"."DIMGEOGRAPHY_AK";

DROP INDEX "SALES"."DIMPRODUCTCATEGORY_AK";

DROP INDEX "SALES"."DIMPRODUCTSUBCATEGORY_AK";

DROP INDEX "SALES"."DIMPRODUCT_AK";

DROP INDEX "SALES"."DIMPROMOTION_AK";

DROP INDEX "SALES"."DIMRESELLER_AK";

DROP INDEX "SALES"."DIMSALESTERRITORY_AK";

DROP INDEX "SALES"."FACTINTERNETSALES_AK";

DROP INDEX "SALES"."FACTRESELLERSALES_AK";

DROP TABLE "SALES"."DIMCURRENCY";

DROP TABLE "SALES"."DIMCUSTOMER";

DROP TABLE "SALES"."DIMDATE";

DROP TABLE "SALES"."DIMEMPLOYEE";

DROP TABLE "SALES"."DIMGEOGRAPHY";

DROP TABLE "SALES"."DIMPRODUCT";

DROP TABLE "SALES"."DIMPRODUCTCATEGORY";

DROP TABLE "SALES"."DIMPRODUCTSUBCATEGORY";

DROP TABLE "SALES"."DIMPROMOTION";

DROP TABLE "SALES"."DIMRESELLER";

DROP TABLE "SALES"."DIMSALESTERRITORY";

DROP TABLE "SALES"."FACTINTERNETSALES";

DROP TABLE "SALES"."FACTRESELLERSALES";

DROP SCHEMA "SALES" RESTRICT;

DROP TABLESPACE "TABLESPACES";

DROP DATABASE PARTITION GROUP "PARTITIONGROUP1";

CREATE DATABASE PARTITION GROUP "PARTITIONGROUP1" ON DBPARTITIONNUMS (0);

CREATE REGULAR TABLESPACE "TABLESPACES"
	IN DATABASE PARTITION GROUP "PARTITIONGROUP1"
	MANAGED BY AUTOMATIC STORAGE
	AUTORESIZE YES
	OVERHEAD 7.5
	TRANSFERRATE 0.06
	DATA TAG INHERIT;

CREATE SCHEMA "SALES";

CREATE TABLE "SALES"."DIMCURRENCY" (
		"CURRENCYKEY" INTEGER NOT NULL, 
		"CURRENCYALTERNATEKEY" CHAR(3) NOT NULL, 
		"CURRENCYNAME" VARCHAR(50) NOT NULL
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMCUSTOMER" (
		"CUSTOMERKEY" INTEGER NOT NULL, 
		"GEOGRAPHYKEY" INTEGER, 
		"CUSTOMERALTERNATEKEY" VARCHAR(15) NOT NULL, 
		"TITLE" VARCHAR(8), 
		"FIRSTNAME" VARCHAR(50), 
		"MIDDLENAME" VARCHAR(50), 
		"LASTNAME" VARCHAR(50), 
		"NAMESTYLE" INTEGER, 
		"BIRTHDATE" DATE, 
		"MARITALSTATUS" CHAR(1), 
		"SUFFIX" VARCHAR(10), 
		"GENDER" VARCHAR(1), 
		"EMAILADDRESS" VARCHAR(50), 
		"YEARLYINCOME" DECIMAL(5 , 0), 
		"TOTALCHILDREN" INTEGER, 
		"NUMBERCHILDRENATHOME" INTEGER, 
		"ENGLISHEDUCATION" VARCHAR(40), 
		"SPANISHEDUCATION" VARCHAR(40), 
		"FRENCHEDUCATION" VARCHAR(40), 
		"ENGLISHOCCUPATION" VARCHAR(100), 
		"SPANISHOCCUPATION" VARCHAR(100), 
		"FRENCHOCCUPATION" VARCHAR(100), 
		"HOUSEOWNERFLAG" CHAR(1), 
		"NUMBERCARSOWNED" INTEGER, 
		"ADDRESSLINE1" VARCHAR(120), 
		"ADDRESSLINE2" VARCHAR(120), 
		"PHONE" VARCHAR(20), 
		"DATEFIRSTPURCHASE" DATE, 
		"COMMUTEDISTANCE" VARCHAR(15)
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMDATE" (
		"DATEKEY" INTEGER NOT NULL, 
		"FULLDATEALTERNATEKEY" DATE NOT NULL, 
		"DAYNUMBEROFWEEK" INTEGER NOT NULL, 
		"ENGLISHDAYNAMEOFWEEK" VARCHAR(10) NOT NULL, 
		"SPANISHDAYNAMEOFWEEK" VARCHAR(10) NOT NULL, 
		"FRENCHDAYNAMEOFWEEK" VARCHAR(10) NOT NULL, 
		"DAYNUMBEROFMONTH" INTEGER NOT NULL, 
		"DAYNUMBEROFYEAR" SMALLINT NOT NULL, 
		"WEEKNUMBEROFYEAR" INTEGER NOT NULL, 
		"ENGLISHMONTHNAME" VARCHAR(10) NOT NULL, 
		"SPANISHMONTHNAME" VARCHAR(10) NOT NULL, 
		"FRENCHMONTHNAME" VARCHAR(10) NOT NULL, 
		"MONTHNUMBEROFYEAR" INTEGER NOT NULL, 
		"CALENDARQUARTER" INTEGER NOT NULL, 
		"CALENDARYEAR" SMALLINT NOT NULL, 
		"CALENDARSEMESTER" INTEGER NOT NULL, 
		"FISCALQUARTER" INTEGER NOT NULL, 
		"FISCALYEAR" SMALLINT NOT NULL, 
		"FISCALSEMESTER" INTEGER NOT NULL
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMEMPLOYEE" (
		"EMPLOYEEKEY" INTEGER NOT NULL, 
		"PARENTEMPLOYEEKEY" INTEGER, 
		"EMPLOYEENATIONALIDALTERNATEKEY" VARCHAR(15), 
		"PARENTEMPLOYEENATIONALIDALTERNATEKEY" VARCHAR(15), 
		"SALESTERRITORYKEY" INTEGER, 
		"FIRSTNAME" VARCHAR(50) NOT NULL, 
		"LASTNAME" VARCHAR(50) NOT NULL, 
		"MIDDLENAME" VARCHAR(50), 
		"NAMESTYLE" INTEGER NOT NULL, 
		"TITLE" VARCHAR(50), 
		"HIREDATE" DATE, 
		"BIRTHDATE" DATE, 
		"LOGINID" VARCHAR(256), 
		"EMAILADDRESS" VARCHAR(50), 
		"PHONE" VARCHAR(25), 
		"MARITALSTATUS" CHAR(1), 
		"EMERGENCYCONTACTNAME" VARCHAR(50), 
		"EMERGENCYCONTACTPHONE" VARCHAR(25), 
		"SALARIEDFLAG" INTEGER, 
		"GENDER" CHAR(1), 
		"PAYFREQUENCY" INTEGER, 
		"BASERATE" DECIMAL(5 , 0), 
		"VACATIONHOURS" SMALLINT, 
		"SICKLEAVEHOURS" SMALLINT, 
		"CURRENTFLAG" INTEGER NOT NULL, 
		"SALESPERSONFLAG" INTEGER NOT NULL, 
		"DEPARTMENTNAME" VARCHAR(50), 
		"STARTDATE" DATE, 
		"ENDDATE" DATE, 
		"STATUS" VARCHAR(50), 
		"EMPLOYEEPHOTO" VARCHAR (10) FOR BIT DATA
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMGEOGRAPHY" (
		"GEOGRAPHYKEY" INTEGER NOT NULL, 
		"CITY" VARCHAR(30), 
		"STATEPROVINCECODE" VARCHAR(3), 
		"STATEPROVINCENAME" VARCHAR(50), 
		"COUNTRYREGIONCODE" VARCHAR(3), 
		"ENGLISHCOUNTRYREGIONNAME" VARCHAR(50), 
		"SPANISHCOUNTRYREGIONNAME" VARCHAR(50), 
		"FRENCHCOUNTRYREGIONNAME" VARCHAR(50), 
		"POSTALCODE" VARCHAR(15), 
		"SALESTERRITORYKEY" INTEGER, 
		"IPADDRESSLOCATOR" VARCHAR(15)
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMPRODUCT" (
		"PRODUCTKEY" INTEGER NOT NULL, 
		"PRODUCTALTERNATEKEY" VARCHAR(25), 
		"PRODUCTSUBCATEGORYKEY" INTEGER, 
		"WEIGHTUNITMEASURECODE" CHAR(3), 
		"SIZEUNITMEASURECODE" CHAR(3), 
		"ENGLISHPRODUCTNAME" VARCHAR(50) NOT NULL, 
		"SPANISHPRODUCTNAME" VARCHAR(50) NOT NULL, 
		"FRENCHPRODUCTNAME" VARCHAR(50) NOT NULL, 
		"STANDARDCOST" DECIMAL(5 , 0), 
		"FINISHEDGOODSFLAG" INTEGER NOT NULL, 
		"COLOR" VARCHAR(15) NOT NULL, 
		"SAFETYSTOCKLEVEL" SMALLINT, 
		"REORDERPOINT" SMALLINT, 
		"LISTPRICE" DECIMAL(5 , 0), 
		"SIZE" VARCHAR(50), 
		"SIZERANGE" VARCHAR(50), 
		"WEIGHT" DOUBLE, 
		"DAYSTOMANUFACTURE" INTEGER, 
		"PRODUCTLINE" CHAR(2), 
		"DEALERPRICE" DECIMAL(5 , 0), 
		"CLASS" CHAR(2), 
		"STYLE" CHAR(2), 
		"MODELNAME" VARCHAR(50), 
		"LARGEPHOTO" VARCHAR(1000), 
		"ENGLISHDESCRIPTION" VARCHAR(400), 
		"FRENCHDESCRIPTION" VARCHAR(400), 
		"CHINESEDESCRIPTION" VARCHAR(400), 
		"ARABICDESCRIPTION" VARCHAR(400), 
		"HEBREWDESCRIPTION" VARCHAR(400), 
		"THAIDESCRIPTION" VARCHAR(400), 
		"GERMANDESCRIPTION" VARCHAR(400), 
		"JAPANESEDESCRIPTION" VARCHAR(400), 
		"TURKISHDESCRIPTION" VARCHAR(400), 
		"STARTDATE" DATE, 
		"ENDDATE" DATE, 
		"STATUS" VARCHAR(7)
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMPRODUCTCATEGORY" (
		"PRODUCTCATEGORYKEY" INTEGER NOT NULL, 
		"PRODUCTCATEGORYALTERNATEKEY" INTEGER, 
		"ENGLISHPRODUCTCATEGORYNAME" VARCHAR(50) NOT NULL, 
		"SPANISHPRODUCTCATEGORYNAME" VARCHAR(50) NOT NULL, 
		"FRENCHPRODUCTCATEGORYNAME" VARCHAR(50) NOT NULL
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMPRODUCTSUBCATEGORY" (
		"PRODUCTSUBCATEGORYKEY" INTEGER NOT NULL, 
		"PRODUCTSUBCATEGORYALTERNATEKEY" INTEGER, 
		"ENGLISHPRODUCTSUBCATEGORYNAME" VARCHAR(50) NOT NULL, 
		"SPANISHPRODUCTSUBCATEGORYNAME" VARCHAR(50) NOT NULL, 
		"FRENCHPRODUCTSUBCATEGORYNAME" VARCHAR(50) NOT NULL, 
		"PRODUCTCATEGORYKEY" INTEGER
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMPROMOTION" (
		"PROMOTIONKEY" INTEGER NOT NULL, 
		"PROMOTIONALTERNATEKEY" INTEGER, 
		"ENGLISHPROMOTIONNAME" VARCHAR(255), 
		"SPANISHPROMOTIONNAME" VARCHAR(255), 
		"FRENCHPROMOTIONNAME" VARCHAR(255), 
		"DISCOUNTPCT" DOUBLE, 
		"ENGLISHPROMOTIONTYPE" VARCHAR(50), 
		"SPANISHPROMOTIONTYPE" VARCHAR(50), 
		"FRENCHPROMOTIONTYPE" VARCHAR(50), 
		"ENGLISHPROMOTIONCATEGORY" VARCHAR(50), 
		"SPANISHPROMOTIONCATEGORY" VARCHAR(50), 
		"FRENCHPROMOTIONCATEGORY" VARCHAR(50), 
		"STARTDATE" DATE NOT NULL, 
		"ENDDATE" DATE, 
		"MINQTY" INTEGER, 
		"MAXQTY" INTEGER
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMRESELLER" (
		"RESELLERKEY" INTEGER NOT NULL, 
		"GEOGRAPHYKEY" INTEGER, 
		"RESELLERALTERNATEKEY" VARCHAR(15), 
		"PHONE" VARCHAR(25), 
		"BUSINESSTYPE" VARCHAR(20) NOT NULL, 
		"RESELLERNAME" VARCHAR(50) NOT NULL, 
		"NUMBEREMPLOYEES" INTEGER, 
		"ORDERFREQUENCY" CHAR(1), 
		"ORDERMONTH" INTEGER, 
		"FIRSTORDERYEAR" INTEGER, 
		"LASTORDERYEAR" INTEGER, 
		"PRODUCTLINE" VARCHAR(50), 
		"ADDRESSLINE1" VARCHAR(60), 
		"ADDRESSLINE2" VARCHAR(60), 
		"ANNUALSALES" DECIMAL(5 , 0), 
		"BANKNAME" VARCHAR(50), 
		"MINPAYMENTTYPE" INTEGER, 
		"MINPAYMENTAMOUNT" DECIMAL(5 , 0), 
		"ANNUALREVENUE" DECIMAL(5 , 0), 
		"YEAROPENED" INTEGER
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."DIMSALESTERRITORY" (
		"SALESTERRITORYKEY" INTEGER NOT NULL, 
		"SALESTERRITORYALTERNATEKEY" INTEGER, 
		"SALESTERRITORYREGION" VARCHAR(50) NOT NULL, 
		"SALESTERRITORYCOUNTRY" VARCHAR(50) NOT NULL, 
		"SALESTERRITORYGROUP" VARCHAR(50), 
		"SALESTERRITORYIMAGE" VARCHAR(1000)
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."FACTINTERNETSALES" (
		"CUSTOMERKEY" INTEGER NOT NULL, 
		"DATEKEY" INTEGER NOT NULL, 
		"SALESORDERNUMBER" VARCHAR(20) NOT NULL, 
		"SALESORDERLINENUMBER" INTEGER NOT NULL, 
		"PRODUCTKEY" INTEGER NOT NULL, 
		"ORDERDATEKEY" INTEGER NOT NULL, 
		"DUEDATEKEY" INTEGER NOT NULL, 
		"SHIPDATEKEY" INTEGER NOT NULL, 
		"PROMOTIONKEY" INTEGER NOT NULL, 
		"CURRENCYKEY" INTEGER NOT NULL, 
		"SALESTERRITORYKEY" INTEGER NOT NULL, 
		"REVISIONNUMBER" INTEGER NOT NULL, 
		"ORDERQUANTITY" SMALLINT NOT NULL, 
		"UNITPRICE" DECIMAL(5 , 0) NOT NULL, 
		"EXTENDEDAMOUNT" DECIMAL(5 , 0) NOT NULL, 
		"UNITPRICEDISCOUNTPCT" DOUBLE NOT NULL, 
		"DISCOUNTAMOUNT" DOUBLE NOT NULL, 
		"PRODUCTSTANDARDCOST" DECIMAL(5 , 0) NOT NULL, 
		"TOTALPRODUCTCOST" DECIMAL(5 , 0) NOT NULL, 
		"SALESAMOUNT" DECIMAL(5 , 0) NOT NULL, 
		"TAXAMT" DECIMAL(5 , 0) NOT NULL, 
		"FREIGHT" DECIMAL(5 , 0) NOT NULL, 
		"CARRIERTRACKINGNUMBER" VARCHAR(25), 
		"CUSTOMERPONUMBER" VARCHAR(25), 
		"ORDERDATE" DATE, 
		"DUEDATE" DATE, 
		"SHIPDATE" DATE
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE TABLE "SALES"."FACTRESELLERSALES" (
		"SALESORDERNUMBER" VARCHAR(20) NOT NULL, 
		"SALESORDERLINENUMBER" INTEGER NOT NULL, 
		"PRODUCTKEY" INTEGER NOT NULL, 
		"ORDERDATEKEY" INTEGER NOT NULL, 
		"DUEDATEKEY" INTEGER NOT NULL, 
		"SHIPDATEKEY" INTEGER NOT NULL, 
		"RESELLERKEY" INTEGER NOT NULL, 
		"EMPLOYEEKEY" INTEGER NOT NULL, 
		"PROMOTIONKEY" INTEGER NOT NULL, 
		"CURRENCYKEY" INTEGER NOT NULL, 
		"SALESTERRITORYKEY" INTEGER NOT NULL, 
		"REVISIONNUMBER" INTEGER, 
		"ORDERQUANTITY" SMALLINT, 
		"UNITPRICE" DECIMAL(5 , 0), 
		"EXTENDEDAMOUNT" DECIMAL(5 , 0), 
		"UNITPRICEDISCOUNTPCT" DOUBLE, 
		"DISCOUNTAMOUNT" DOUBLE, 
		"PRODUCTSTANDARDCOST" DECIMAL(5 , 0), 
		"TOTALPRODUCTCOST" DECIMAL(5 , 0), 
		"SALESAMOUNT" DECIMAL(5 , 0), 
		"TAXAMT" DECIMAL(5 , 0), 
		"FREIGHT" DECIMAL(5 , 0), 
		"CARRIERTRACKINGNUMBER" VARCHAR(25), 
		"CUSTOMERPONUMBER" VARCHAR(25), 
		"ORDERDATE" DATE, 
		"DUEDATE" DATE, 
		"SHIPDATE" DATE, 
		"ATTRIBUTE1" CHAR(5)
	)
	DATA CAPTURE NONE 
	IN "TABLESPACES"
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMCURRENCY_AK"
	ON "SALES"."DIMCURRENCY"
	("CURRENCYKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMCUSTOMER_AK"
	ON "SALES"."DIMCUSTOMER"
	("CUSTOMERKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMDATE_AK"
	ON "SALES"."DIMDATE"
	("DATEKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMEMPLOYEE_AK"
	ON "SALES"."DIMEMPLOYEE"
	("EMPLOYEEKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMGEOGRAPHY_AK"
	ON "SALES"."DIMGEOGRAPHY"
	("GEOGRAPHYKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMPRODUCTCATEGORY_AK"
	ON "SALES"."DIMPRODUCTCATEGORY"
	("PRODUCTCATEGORYKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMPRODUCTSUBCATEGORY_AK"
	ON "SALES"."DIMPRODUCTSUBCATEGORY"
	("PRODUCTSUBCATEGORYKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMPRODUCT_AK"
	ON "SALES"."DIMPRODUCT"
	("PRODUCTKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMPROMOTION_AK"
	ON "SALES"."DIMPROMOTION"
	("PROMOTIONKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMRESELLER_AK"
	ON "SALES"."DIMRESELLER"
	("RESELLERKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."DIMSALESTERRITORY_AK"
	ON "SALES"."DIMSALESTERRITORY"
	("SALESTERRITORYKEY"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."FACTINTERNETSALES_AK"
	ON "SALES"."FACTINTERNETSALES"
	("SALESORDERNUMBER"		ASC, 
	  "SALESORDERLINENUMBER"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

CREATE UNIQUE INDEX "SALES"."FACTRESELLERSALES_AK"
	ON "SALES"."FACTRESELLERSALES"
	("SALESORDERNUMBER"		ASC, 
	  "SALESORDERLINENUMBER"		ASC)
	MINPCTUSED 0
	ALLOW REVERSE SCANS
	PAGE SPLIT SYMMETRIC
	COLLECT SAMPLED DETAILED STATISTICS
	COMPRESS NO;

ALTER TABLE "SALES"."DIMCURRENCY" ADD CONSTRAINT "DIMCURRENCY_PK" PRIMARY KEY
	("CURRENCYKEY");

ALTER TABLE "SALES"."DIMCUSTOMER" ADD CONSTRAINT "DIMCUSTOMER_PK" PRIMARY KEY
	("CUSTOMERKEY");

ALTER TABLE "SALES"."DIMDATE" ADD CONSTRAINT "DIMDATE_PK" PRIMARY KEY
	("DATEKEY");

ALTER TABLE "SALES"."DIMEMPLOYEE" ADD CONSTRAINT "DIMEMPLOYEE_PK" PRIMARY KEY
	("EMPLOYEEKEY");

ALTER TABLE "SALES"."DIMGEOGRAPHY" ADD CONSTRAINT "DIMGEOGRAPHY_PK" PRIMARY KEY
	("GEOGRAPHYKEY");

ALTER TABLE "SALES"."DIMPRODUCT" ADD CONSTRAINT "DIMPRODUCT_PK" PRIMARY KEY
	("PRODUCTKEY");

ALTER TABLE "SALES"."DIMPRODUCTCATEGORY" ADD CONSTRAINT "DIMPRODUCTCATEGORY_PK" PRIMARY KEY
	("PRODUCTCATEGORYKEY");

ALTER TABLE "SALES"."DIMPRODUCTSUBCATEGORY" ADD CONSTRAINT "DIMPRODUCTSUBCATEGORY_PK" PRIMARY KEY
	("PRODUCTSUBCATEGORYKEY");

ALTER TABLE "SALES"."DIMPROMOTION" ADD CONSTRAINT "DIMPROMOTION_PK" PRIMARY KEY
	("PROMOTIONKEY");

ALTER TABLE "SALES"."DIMRESELLER" ADD CONSTRAINT "DIMRESELLER_PK" PRIMARY KEY
	("RESELLERKEY");

ALTER TABLE "SALES"."DIMSALESTERRITORY" ADD CONSTRAINT "DIMSALESTERRITORY_PK" PRIMARY KEY
	("SALESTERRITORYKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_PK" PRIMARY KEY
	("CUSTOMERKEY", 
	 "DATEKEY", 
	 "SALESORDERNUMBER", 
	 "SALESORDERLINENUMBER");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_PK" PRIMARY KEY
	("SALESORDERNUMBER", 
	 "SALESORDERLINENUMBER");

ALTER TABLE "SALES"."DIMCUSTOMER" ADD CONSTRAINT "DIMCUSTOMER_DIMGEOGRAPHY_FK" FOREIGN KEY
	("GEOGRAPHYKEY")
	REFERENCES "SALES"."DIMGEOGRAPHY"
	("GEOGRAPHYKEY");

ALTER TABLE "SALES"."DIMEMPLOYEE" ADD CONSTRAINT "DIMEMPLOYEE_DIMEMPLOYEE_FK" FOREIGN KEY
	("PARENTEMPLOYEEKEY")
	REFERENCES "SALES"."DIMEMPLOYEE"
	("EMPLOYEEKEY");

ALTER TABLE "SALES"."DIMEMPLOYEE" ADD CONSTRAINT "DIMEMPLOYEE_DIMSALESTERRITORY_FK" FOREIGN KEY
	("SALESTERRITORYKEY")
	REFERENCES "SALES"."DIMSALESTERRITORY"
	("SALESTERRITORYKEY");

ALTER TABLE "SALES"."DIMGEOGRAPHY" ADD CONSTRAINT "DIMGEOGRAPHY_DIMSALESTERRITORY_FK" FOREIGN KEY
	("SALESTERRITORYKEY")
	REFERENCES "SALES"."DIMSALESTERRITORY"
	("SALESTERRITORYKEY");

ALTER TABLE "SALES"."DIMPRODUCT" ADD CONSTRAINT "DIMPRODUCT_DIMPRODUCTSUBCATEGORY_FK" FOREIGN KEY
	("PRODUCTSUBCATEGORYKEY")
	REFERENCES "SALES"."DIMPRODUCTSUBCATEGORY"
	("PRODUCTSUBCATEGORYKEY");

ALTER TABLE "SALES"."DIMPRODUCTSUBCATEGORY" ADD CONSTRAINT "DIMPRODUCTSUBCATEGORY_DIMPRODUCTCATEGORY_FK" FOREIGN KEY
	("PRODUCTCATEGORYKEY")
	REFERENCES "SALES"."DIMPRODUCTCATEGORY"
	("PRODUCTCATEGORYKEY");

ALTER TABLE "SALES"."DIMRESELLER" ADD CONSTRAINT "DIMRESELLER_DIMGEOGRAPHY_FK" FOREIGN KEY
	("GEOGRAPHYKEY")
	REFERENCES "SALES"."DIMGEOGRAPHY"
	("GEOGRAPHYKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMCURRENCY_FK" FOREIGN KEY
	("CURRENCYKEY")
	REFERENCES "SALES"."DIMCURRENCY"
	("CURRENCYKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMCUSTOMER_FK" FOREIGN KEY
	("CUSTOMERKEY")
	REFERENCES "SALES"."DIMCUSTOMER"
	("CUSTOMERKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMCUSTOMER_FK1" FOREIGN KEY
	("CUSTOMERKEY")
	REFERENCES "SALES"."DIMCUSTOMER"
	("CUSTOMERKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK" FOREIGN KEY
	("ORDERDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK1" FOREIGN KEY
	("DUEDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK2" FOREIGN KEY
	("SHIPDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK3" FOREIGN KEY
	("ORDERDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK4" FOREIGN KEY
	("DUEDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMDATE_FK5" FOREIGN KEY
	("SHIPDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMPRODUCT_FK" FOREIGN KEY
	("PRODUCTKEY")
	REFERENCES "SALES"."DIMPRODUCT"
	("PRODUCTKEY");

ALTER TABLE "SALES"."FACTINTERNETSALES" ADD CONSTRAINT "FACTINTERNETSALES_DIMPROMOTION_FK" FOREIGN KEY
	("PROMOTIONKEY")
	REFERENCES "SALES"."DIMPROMOTION"
	("PROMOTIONKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMDATE_FK" FOREIGN KEY
	("ORDERDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMDATE_FK1" FOREIGN KEY
	("DUEDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMDATE_FK2" FOREIGN KEY
	("SHIPDATEKEY")
	REFERENCES "SALES"."DIMDATE"
	("DATEKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMEMPLOYEE_FK" FOREIGN KEY
	("EMPLOYEEKEY")
	REFERENCES "SALES"."DIMEMPLOYEE"
	("EMPLOYEEKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMPRODUCT_FK" FOREIGN KEY
	("PRODUCTKEY")
	REFERENCES "SALES"."DIMPRODUCT"
	("PRODUCTKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMPROMOTION_FK" FOREIGN KEY
	("PROMOTIONKEY")
	REFERENCES "SALES"."DIMPROMOTION"
	("PROMOTIONKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMRESELLER_FK" FOREIGN KEY
	("RESELLERKEY")
	REFERENCES "SALES"."DIMRESELLER"
	("RESELLERKEY");

ALTER TABLE "SALES"."FACTRESELLERSALES" ADD CONSTRAINT "FACTRESELLERSALES_DIMSALESTERRITORY_FK" FOREIGN KEY
	("SALESTERRITORYKEY")
	REFERENCES "SALES"."DIMSALESTERRITORY"
	("SALESTERRITORYKEY");

