DROP SCHEMA IF EXISTS unidb CASCADE;
CREATE SCHEMA unidb;

SET search_path = unidb, public;

CREATE TABLE regioncodes (
	code smallint PRIMARY KEY,
	description varchar(50)
);

INSERT INTO regioncodes VALUES
	(0, 'US Service schools'),
	(1, 'New England'),
	(2, 'Mid East'),
	(3, 'Great Lakes'),
	(4, 'Plains'),
	(5, 'Southeast'),
	(6, 'Southwest'),
	(7, 'Rocky Mountains'),
	(8, 'Far West'),
	(9, 'Outlying areas'),
	(-3, 'Not available');

CREATE TABLE stateregions(
	code smallint,
	STABBR varchar(2) PRIMARY KEY
);

INSERT INTO stateregions VALUES
	(1, 'CT'), (1, 'ME'), (1, 'MA'), (1, 'NH'), (1, 'RI'), (1, 'VT'),
	(2, 'DE'), (2, 'DC'), (2, 'MD'), (2, 'NJ'), (2, 'NY'), (2, 'PA'),
	(3, 'IL'), (3, 'IN'), (3, 'MI'), (3, 'OH'), (3, 'WI'),
	(4, 'IA'), (4, 'KS'), (4, 'MN'), (4, 'MO'), (4, 'NE'), (4, 'ND'), (4, 'SD'),
	(5, 'AL'), (5, 'AR'), (5, 'FL'), (5, 'GA'), (5, 'KY'), (5, 'LA'), (5, 'MS'), (5, 'NC'), (5, 'SC'), (5, 'TN'), (5, 'VA'), (5, 'WV'),
	(6, 'AZ'), (6, 'NM'), (6, 'OK'), (6, 'TX'),
	(7, 'CO'), (7, 'ID'), (7, 'MT'), (7, 'UT'), (7, 'WY'),
	(8, 'AK'), (8, 'CA'), (8, 'HI'), (8, 'NV'), (8, 'OR'), (8, 'WA'),
	(9, 'AS'), (9, 'FM'), (9, 'GU'), (9, 'MH'), (9, 'MP'), (9, 'PR'), (9, 'PW'), (9, 'VI');

DROP TABLE IF EXISTS universities;

CREATE TABLE universities (
--	UNITID varchar(64) PRIMARY KEY,
	UNITID bigint PRIMARY KEY,
	INSTNM varchar(300),
	ADDR varchar(100),
	CITY varchar(100),
	STABBR varchar(2),
	ZIP varchar(12),
	FIPS smallint,
	OBEREG smallint,
	CHFNM varchar(100),
	CHFTITLE varchar(100),
	GENTELE varchar(20),
	FAXTELE varchar(20),
	EIN varchar(20),
	OPEID varchar(20),
	OPEFLAG varchar(20),
	WEBADDR varchar(200),
	ADMINURL varchar(200),
	FAIDURL varchar(200),
	APPLURL varchar(200),
	NPRICURL varchar(200),
	SECTOR varchar(20),
	ICLEVEL varchar(20),
	CONTROL varchar(20),
	HLOFFER varchar(20),
	UGOFFER varchar(20),
	GROFFER varchar(20),
	HDEGOFR1 varchar(20),
	DEGGRANT varchar(20),
	HBCU varchar(20),
	HOSPITAL varchar(20),
	MEDICAL varchar(20),
	TRIBAL varchar(20),
	LOCALE varchar(20),
	OPENPUBL varchar(20),
	ACT varchar(20),
	NEWID varchar(20),
	DEATHYR varchar(20),
	CLOSEDAT varchar(20),
	CYACTIVE varchar(20),
	POSTSEC varchar(20),
	PSEFLAG varchar(20),
	PSET4FLG varchar(20),
	RPTMTH varchar(20),
	IALIAS varchar(1000),
	INSTCAT varchar(20),
	CCBASIC varchar(20),
	CCIPUG varchar(20),
	CCIPGRAD varchar(20),
	CCUGPROF varchar(20),
	CCENRPRF varchar(20),
	CCSIZSET varchar(20),
	CARNEGIE varchar(20),
	LANDGRNT varchar(20),
	INSTSIZE varchar(20),
	CBSA varchar(20),
	CBSATYPE varchar(20),
	CSA varchar(20),
	NECTA varchar(20),
	F1SYSTYP varchar(20),
	F1SYSNAM varchar(100),
	F1SYSCOD varchar(20),
	COUNTYCD varchar(20),
	COUNTYNM varchar(200),
	CNGDSTCD varchar(20),
	LONGITUD varchar(20),
	LATITUDE varchar(20)
);

\copy universities FROM '../unicsvtest/postscndryunivsrvy2013dirinfo.csv' WITH ( FORMAT CSV, HEADER, QUOTE '"', ENCODING 'LATIN1' ) ;
--SELECT instnm FROM universities WHERE stabbr = 'MO';

--second dataset table
DROP TABLE IF EXISTS offerings;

CREATE TABLE offerings (
	--UNITID varchar(8),
	UNITID bigint PRIMARY KEY,
	PEO1ISTR varchar(8),
	PEO2ISTR varchar(8),
	PEO3ISTR varchar(8),
	PEO4ISTR varchar(8),
	PEO5ISTR varchar(8),
	PEO6ISTR varchar(8),
	CNTLAFFI varchar(8),
	PUBPRIME varchar(8),
	PUBSECON varchar(8),
	RELAFFIL varchar(8),
	LEVEL1 varchar(8),
	LEVEL2 varchar(8),
	LEVEL3 varchar(8),
	LEVEL4 varchar(8),
	LEVEL5 varchar(8),
	LEVEL6 varchar(8),
	LEVEL7 varchar(8),
	LEVEL8 varchar(8),
	LEVEL12 varchar(8),
	LEVEL17 varchar(8),
	LEVEL18 varchar(8),
	LEVEL19 varchar(8),
	OPENADMP integer,
	ADMCON1 varchar(8),
	ADMCON2 varchar(8),
	ADMCON3 varchar(8),
	ADMCON4 varchar(8),
	ADMCON5 varchar(8),
	ADMCON6 varchar(8),
	ADMCON7 varchar(8),
	ADMCON8 varchar(8),
	ADMCON9 varchar(8),
	APPDATE varchar(8),
	XAPPLCNM varchar(8),
	APPLCNM varchar(8),
	XAPPLCNW varchar(8),
	APPLCNW varchar(8),
	XADMSSNM varchar(8),
	ADMSSNM varchar(8),
	XADMSSNW varchar(8),
	ADMSSNW varchar(8),
	XENRLFTM varchar(8),
	ENRLFTM integer,
	XENRLFTW varchar(8),
	ENRLFTW integer,
	XENRLPTM varchar(8),
	ENRLPTM integer,
	XENRLPTW varchar(8),
	ENRLPTW integer,
	SATACTDT varchar(8),
	XSATNUM varchar(8),
	SATNUM varchar(8),
	XSATPCT varchar(8),
	SATPCT varchar(8),
	XACTNUM varchar(8),
	ACTNUM varchar(8),
	XACTPCT varchar(8),
	ACTPCT varchar(8),
	XSATVR25 varchar(8),
	SATVR25 varchar(8),
	XSATVR75 varchar(8),
	SATVR75 varchar(8),
	XSATMT25 varchar(8),
	SATMT25 varchar(8),
	XSATMT75 varchar(8),
	SATMT75 varchar(8),
	XSATWR25 varchar(8),
	SATWR25 varchar(8),
	XSATWR75 varchar(8),
	SATWR75 varchar(8),
	XACTCM25 varchar(8),
	ACTCM25 varchar(8),
	XACTCM75 varchar(8),
	ACTCM75 varchar(8),
	XACTEN25 varchar(8),
	ACTEN25 varchar(8),
	XACTEN75 varchar(8),
	ACTEN75 varchar(8),
	XACTMT25 varchar(8),
	ACTMT25 varchar(8),
	XACTMT75 varchar(8),
	ACTMT75 varchar(8),
	XACTWR25 varchar(8),
	ACTWR25 varchar(8),
	XACTWR75 varchar(8),
	ACTWR75 varchar(8),
	CREDITS1 varchar(8),
	CREDITS2 varchar(8),
	CREDITS3 varchar(8),
	CREDITS4 varchar(8),
	SLO3 varchar(8),
	SLO5 varchar(8),
	SLO51 varchar(8),
	SLO52 varchar(8),
	SLO53 varchar(8),
	SLO6 varchar(8),
	SLO7 varchar(8),
	SLO8 varchar(8),
	SLO81 varchar(8),
	SLO82 varchar(8),
	SLO83 varchar(8),
	SLO9 varchar(8),
	YRSCOLL varchar(8),
	STUSRV1 varchar(8),
	STUSRV2 varchar(8),
	STUSRV3 varchar(8),
	STUSRV4 varchar(8),
	STUSRV8 varchar(8),
	STUSRV9 varchar(8),
	LIBFAC varchar(8),
	ATHASSOC varchar(8),
	ASSOC1 varchar(8),
	ASSOC2 varchar(8),
	ASSOC3 varchar(8),
	ASSOC4 varchar(8),
	ASSOC5 varchar(8),
	ASSOC6 varchar(8),
	SPORT1 varchar(8),
	CONFNO1 varchar(8),
	SPORT2 varchar(8),
	CONFNO2 varchar(8),
	SPORT3 varchar(8),
	CONFNO3 varchar(8),
	SPORT4 varchar(8),
	CONFNO4 varchar(8),
	CALSYS varchar(8),
	XAPPFEEU varchar(8),
	APPLFEEU varchar(8),
	XAPPFEEG varchar(8),
	APPLFEEG varchar(8),
	FT_UG varchar(8),
	FT_FTUG varchar(8),
	FT_GD varchar(8),
	PT_UG varchar(8),
	PT_FTUG varchar(8),
	PT_GD varchar(8),
	TUITVARY varchar(8),
	ROOM varchar(8),
	XROOMCAP varchar(8),
	ROOMCAP varchar(8),
	BOARD varchar(8),
	XMEALSWK varchar(8),
	MEALSWK varchar(8),
	XROOMAMT varchar(8),
	ROOMAMT varchar(8),
	XBORDAMT varchar(8),
	BOARDAMT varchar(8),
	XRMBDAMT varchar(8),
	RMBRDAMT varchar(8),
	ALLONCAM varchar(8),
	XENRLM varchar(8),
	ENRLM integer,
	XENRLW varchar(8),
	ENRLW integer,
	XENRLT varchar(8),
	ENRLT varchar(8),--total enrollment
	XAPPLCN varchar(8),
	APPLCN varchar(8),
	XADMSSN varchar(8),
	ADMSSN varchar(8),
	XENRLFT varchar(8),
	ENRLFT integer,
	XENRLPT varchar(8),
	ENRLPT integer,
	TUITPL varchar(8),
	TUITPL1 varchar(8),
	TUITPL2 varchar(8),
	TUITPL3 varchar(8),
	TUITPL4 varchar(8),
	DISAB varchar(8),
	XDISABPC varchar(8),
	DISABPCT varchar(8)
);
\copy offerings FROM '../unicsvtest/postscndryunivsrvy2010edctnoffrngsaaupdated.csv' WITH ( FORMAT CSV, HEADER, QUOTE '"', ENCODING 'LATIN1' ) ;

CREATE TABLE unistats AS
	SELECT instnm, unitid, cntlaffi, level3, level5, level7, level19, openadmp, enrlt, webaddr, applurl, yrscoll
	FROM universities INNER JOIN offerings USING(unitid);

CREATE TABLE enrlstats AS
<<<<<<< HEAD
	SELECT unitid, ENRLM, ENRLW, ENRLFTM, ENRLFTW, ENRLPTM, ENRLPTW
=======
	SELECT unitid, ENRLFTM, ENRLFTW, ENRLPTM, ENRLPTW, enrlt
>>>>>>> 1b53f210d76130a2013373af7eb663f543bed5fb
	FROM offerings;

DROP TABLE IF EXISTS sfa;

CREATE TABLE sfa (
	--UNITID varchar(10),
	UNITID bigint PRIMARY KEY,
	XSCUGRAD varchar(10),
	SCUGRAD varchar(10),
	XSCUGFFN varchar(10),
	SCUGFFN varchar(10),
	XSCUGFFP varchar(10),
	SCUGFFP varchar(10),
	XSCFA2 varchar(10),
	SCFA2 varchar(10),
	XSCFA1N varchar(10),
	SCFA1N varchar(10),
	XSCFA1P varchar(10),
	SCFA1P varchar(10),
	XSCFA11N varchar(10),
	SCFA11N varchar(10),
	XSCFA11P varchar(10),
	SCFA11P varchar(10),
	XSCFA12N varchar(10),
	SCFA12N varchar(10),
	XSCFA12P varchar(10),
	SCFA12P varchar(10),
	XSCFA13N varchar(10),
	SCFA13N varchar(10),
	XSCFA13P varchar(10),
	SCFA13P varchar(10),
	XSCFA14N varchar(10),
	SCFA14N varchar(10),
	XSCFA14P varchar(10),
	SCFA14P varchar(10),
	XSCFY2 varchar(10),
	SCFY2 varchar(10),
	XSCFY1N varchar(10),
	SCFY1N varchar(10),
	XSCFY1P varchar(10),
	SCFY1P varchar(10),
	XSCFY11N varchar(10),
	SCFY11N varchar(10),
	XSCFY11P varchar(10),
	SCFY11P varchar(10),
	XSCFY12N varchar(10),
	SCFY12N varchar(10),
	XSCFY12P varchar(10),
	SCFY12P varchar(10),
	XSCFY13N varchar(10),
	SCFY13N varchar(10),
	XSCFY13P varchar(10),
	SCFY13P varchar(10),
	XSCFY14N varchar(10),
	SCFY14N varchar(10),
	XSCFY14P varchar(10),
	SCFY14P varchar(10),
	XUAGRNTN varchar(10),
	UAGRNTN varchar(10),
	XUAGRNTP varchar(10),
	UAGRNTP varchar(10),
	XUAGRNTT varchar(10),
	UAGRNTT varchar(10),
	XUAGRNTA varchar(10),
	UAGRNTA varchar(10),
	XUPGRNTN varchar(10),
	UPGRNTN varchar(10),
	XUPGRNTP varchar(10),
	UPGRNTP varchar(10),
	XUPGRNTT varchar(10),
	UPGRNTT varchar(10),
	XUPGRNTA varchar(10),
	UPGRNTA varchar(10),
	XUFLOANN varchar(10),
	UFLOANN varchar(10),
	XUFLOANP varchar(10),
	UFLOANP varchar(10),
	XUFLOANT varchar(10),
	UFLOANT varchar(10),
	XUFLOANA varchar(10),
	UFLOANA varchar(10),
	XANYAIDN varchar(10),
	ANYAIDN varchar(10),
	XANYAIDP varchar(10),
	ANYAIDP varchar(10),
	XAIDFSIN varchar(10),
	AIDFSIN varchar(10),
	XAIDFSIP varchar(10),
	AIDFSIP varchar(10),
	XAGRNT_N varchar(10),
	AGRNT_N varchar(10),
	XAGRNT_P varchar(10),
	AGRNT_P varchar(10),
	XAGRNT_T varchar(10),
	AGRNT_T varchar(10),
	XAGRNT_A varchar(10),
	AGRNT_A varchar(10),
	XFGRNT_N varchar(10),
	FGRNT_N varchar(10),
	XFGRNT_P varchar(10),
	FGRNT_P varchar(10),
	XFGRNT_T varchar(10),
	FGRNT_T varchar(10),
	XFGRNT_A varchar(10),
	FGRNT_A varchar(10),
	XPGRNT_N varchar(10),
	PGRNT_N varchar(10),
	XPGRNT_P varchar(10),
	PGRNT_P varchar(10),
	XPGRNT_T varchar(10),
	PGRNT_T varchar(10),
	XPGRNT_A varchar(10),
	PGRNT_A varchar(10),
	XOFGRT_N varchar(10),
	OFGRT_N varchar(10),
	XOFGRT_P varchar(10),
	OFGRT_P varchar(10),
	XOFGRT_T varchar(10),
	OFGRT_T varchar(10),
	XOFGRT_A varchar(10),
	OFGRT_A varchar(10),
	XSGRNT_N varchar(10),
	SGRNT_N varchar(10),
	XSGRNT_P varchar(10),
	SGRNT_P varchar(10),
	XSGRNT_T varchar(10),
	SGRNT_T varchar(10),
	XSGRNT_A varchar(10),
	SGRNT_A varchar(10),
	XIGRNT_N varchar(10),
	IGRNT_N varchar(10),
	XIGRNT_P varchar(10),
	IGRNT_P varchar(10),
	XIGRNT_T varchar(10),
	IGRNT_T varchar(10),
	XIGRNT_A varchar(10),
	IGRNT_A varchar(10),
	XLOAN_N varchar(10),
	LOAN_N varchar(10),
	XLOAN_P varchar(10),
	LOAN_P varchar(10),
	XLOAN_T varchar(10),
	LOAN_T varchar(10),
	XLOAN_A varchar(10),
	LOAN_A varchar(10),
	XFLOAN_N varchar(10),
	FLOAN_N varchar(10),
	XFLOAN_P varchar(10),
	FLOAN_P varchar(10),
	XFLOAN_T varchar(10),
	FLOAN_T varchar(10),
	XFLOAN_A varchar(10),
	FLOAN_A varchar(10),
	XOLOAN_N varchar(10),
	OLOAN_N varchar(10),
	XOLOAN_P varchar(10),
	OLOAN_P varchar(10),
	XOLOAN_T varchar(10),
	OLOAN_T varchar(10),
	XOLOAN_A varchar(10),
	OLOAN_A varchar(10),
	XGISTN2 varchar(10),
	GISTN2 varchar(10),
	XGISTON2 varchar(10),
	GISTON2 varchar(10),
	XGISTWF2 varchar(10),
	GISTWF2 varchar(10),
	XGISTOF2 varchar(10),
	GISTOF2 varchar(10),
	XGISTUN2 varchar(10),
	GISTUN2 varchar(10),
	XGISTT2 varchar(10),
	GISTT2 varchar(10),
	XGISTA2 varchar(10),
	GISTA2 varchar(10),
	XGISTN1 varchar(10),
	GISTN1 varchar(10),
	XGISTON1 varchar(10),
	GISTON1 varchar(10),
	XGISTWF1 varchar(10),
	GISTWF1 varchar(10),
	XGISTOF1 varchar(10),
	GISTOF1 varchar(10),
	XGISTUN1 varchar(10),
	GISTUN1 varchar(10),
	XGISTT1 varchar(10),
	GISTT1 varchar(10),
	XGISTA1 varchar(10),
	GISTA1 varchar(10),
	XGISTN0 varchar(10),
	GISTN0 varchar(10),
	XGISTON0 varchar(10),
	GISTON0 varchar(10),
	XGISTWF0 varchar(10),
	GISTWF0 varchar(10),
	XGISTOF0 varchar(10),
	GISTOF0 varchar(10),
	XGISTUN0 varchar(10),
	GISTUN0 varchar(10),
	XGISTT0 varchar(10),
	GISTT0 varchar(10),
	XGISTA0 varchar(10),
	GISTA0 varchar(10),
	XGIS4N2 varchar(10),
	GIS4N2 varchar(10),
	XGIS4ON2 varchar(10),
	GIS4ON2 varchar(10),
	XGIS4OF2 varchar(10),
	GIS4OF2 varchar(10),
	XGIS4WF2 varchar(10),
	GIS4WF2 varchar(10),
	XGIS4UN2 varchar(10),
	GIS4UN2 varchar(10),
	XGIS4G2 varchar(10),
	GIS4G2 varchar(10),
	XGIS4T2 varchar(10),
	GIS4T2 varchar(10),
	XGIS4A2 varchar(10),
	GIS4A2 varchar(10),
	XGIS4N12 varchar(10),
	GIS4N12 varchar(10),
	XGIS4G12 varchar(10),
	GIS4G12 varchar(10),
	XGIS4T12 varchar(10),
	GIS4T12 varchar(10),
	XGIS4A12 varchar(10),
	GIS4A12 varchar(10),
	XGIS4N22 varchar(10),
	GIS4N22 varchar(10),
	XGIS4G22 varchar(10),
	GIS4G22 varchar(10),
	XGIS4T22 varchar(10),
	GIS4T22 varchar(10),
	XGIS4A22 varchar(10),
	GIS4A22 varchar(10),
	XGIS4N32 varchar(10),
	GIS4N32 varchar(10),
	XGIS4G32 varchar(10),
	GIS4G32 varchar(10),
	XGIS4T32 varchar(10),
	GIS4T32 varchar(10),
	XGIS4A32 varchar(10),
	GIS4A32 varchar(10),
	XGIS4N42 varchar(10),
	GIS4N42 varchar(10),
	XGIS4G42 varchar(10),
	GIS4G42 varchar(10),
	XGIS4T42 varchar(10),
	GIS4T42 varchar(10),
	XGIS4A42 varchar(10),
	GIS4A42 varchar(10),
	XGIS4N52 varchar(10),
	GIS4N52 varchar(10),
	XGIS4G52 varchar(10),
	GIS4G52 varchar(10),
	XGIS4T52 varchar(10),
	GIS4T52 varchar(10),
	XGIS4A52 varchar(10),
	GIS4A52 varchar(10),
	XGIS4N1 varchar(10),
	GIS4N1 varchar(10),
	XGIS4ON1 varchar(10),
	GIS4ON1 varchar(10),
	XGIS4OF1 varchar(10),
	GIS4OF1 varchar(10),
	XGIS4WF1 varchar(10),
	GIS4WF1 varchar(10),
	XGIS4UN1 varchar(10),
	GIS4UN1 varchar(10),
	XGIS4G1 varchar(10),
	GIS4G1 varchar(10),
	XGIS4T1 varchar(10),
	GIS4T1 varchar(10),
	XGIS4A1 varchar(10),
	GIS4A1 varchar(10),
	XGIS4N11 varchar(10),
	GIS4N11 varchar(10),
	XGIS4G11 varchar(10),
	GIS4G11 varchar(10),
	XGIS4T11 varchar(10),
	GIS4T11 varchar(10),
	XGIS4A11 varchar(10),
	GIS4A11 varchar(10),
	XGIS4N21 varchar(10),
	GIS4N21 varchar(10),
	XGIS4G21 varchar(10),
	GIS4G21 varchar(10),
	XGIS4T21 varchar(10),
	GIS4T21 varchar(10),
	XGIS4A21 varchar(10),
	GIS4A21 varchar(10),
	XGIS4N31 varchar(10),
	GIS4N31 varchar(10),
	XGIS4G31 varchar(10),
	GIS4G31 varchar(10),
	XGIS4T31 varchar(10),
	GIS4T31 varchar(10),
	XGIS4A31 varchar(10),
	GIS4A31 varchar(10),
	XGIS4N41 varchar(10),
	GIS4N41 varchar(10),
	XGIS4G41 varchar(10),
	GIS4G41 varchar(10),
	XGIS4T41 varchar(10),
	GIS4T41 varchar(10),
	XGIS4A41 varchar(10),
	GIS4A41 varchar(10),
	XGIS4N51 varchar(10),
	GIS4N51 varchar(10),
	XGIS4G51 varchar(10),
	GIS4G51 varchar(10),
	XGIS4T51 varchar(10),
	GIS4T51 varchar(10),
	XGIS4A51 varchar(10),
	GIS4A51 varchar(10),
	XGIS4N0 varchar(10),
	GIS4N0 varchar(10),
	XGIS4ON0 varchar(10),
	GIS4ON0 varchar(10),
	XGIS4OF0 varchar(10),
	GIS4OF0 varchar(10),
	XGIS4WF0 varchar(10),
	GIS4WF0 varchar(10),
	XGIS4UN0 varchar(10),
	GIS4UN0 varchar(10),
	XGIS4G0 varchar(10),
	GIS4G0 varchar(10),
	XGIS4T0 varchar(10),
	GIS4T0 varchar(10),
	XGIS4A0 varchar(10),
	GIS4A0 varchar(10),
	XGIS4N10 varchar(10),
	GIS4N10 varchar(10),
	XGIS4G10 varchar(10),
	GIS4G10 varchar(10),
	XGIS4T10 varchar(10),
	GIS4T10 varchar(10),
	XGIS4A10 varchar(10),
	GIS4A10 varchar(10),
	XGIS4N20 varchar(10),
	GIS4N20 varchar(10),
	XGIS4G20 varchar(10),
	GIS4G20 varchar(10),
	XGIS4T20 varchar(10),
	GIS4T20 varchar(10),
	XGIS4A20 varchar(10),
	GIS4A20 varchar(10),
	XGIS4N30 varchar(10),
	GIS4N30 varchar(10),
	XGIS4G30 varchar(10),
	GIS4G30 varchar(10),
	XGIS4T30 varchar(10),
	GIS4T30 varchar(10),
	XGIS4A30 varchar(10),
	GIS4A30 varchar(10),
	XGIS4N40 varchar(10),
	GIS4N40 varchar(10),
	XGIS4G40 varchar(10),
	GIS4G40 varchar(10),
	XGIS4T40 varchar(10),
	GIS4T40 varchar(10),
	XGIS4A40 varchar(10),
	GIS4A40 varchar(10),
	XGIS4N50 varchar(10),
	GIS4N50 varchar(10),
	XGIS4G50 varchar(10),
	GIS4G50 varchar(10),
	XGIS4T50 varchar(10),
	GIS4T50 varchar(10),
	XGIS4A50 varchar(10),
	GIS4A50 varchar(10),
	XNPIST2 varchar(10),
	NPIST2 bigint,
	XNPIST1 varchar(10),
	NPIST1 bigint,
	XNPIST0 varchar(10),
	NPIST0 bigint,
	XNPIS412 varchar(10),
	NPIS412 bigint,
	XNPIS422 varchar(10),
	NPIS422 bigint,
	XNPIS432 varchar(10),
	NPIS432 bigint,
	XNPIS442 varchar(10),
	NPIS442 bigint,
	XNPIS452 varchar(10),
	NPIS452 bigint,
	XNPIS411 varchar(10),
	NPIS411 bigint,
	XNPIS421 varchar(10),
	NPIS421 bigint,
	XNPIS431 varchar(10),
	NPIS431 bigint,
	XNPIS441 varchar(10),
	NPIS441 bigint,
	XNPIS451 varchar(10),
	NPIS451 bigint,
	XNPIS410 varchar(10),
	NPIS410 bigint,
	XNPIS420 varchar(10),
	NPIS420 bigint,
	XNPIS430 varchar(10),
	NPIS430 bigint,
	XNPIS440 varchar(10),
	NPIS440 bigint,
	XNPIS450 varchar(10),
	NPIS450 bigint,
	XGRNTN2 varchar(10),
	GRNTN2 varchar(10),
	XGRNTON2 varchar(10),
	GRNTON2 varchar(10),
	XGRNTWF2 varchar(10),
	GRNTWF2 varchar(10),
	XGRNTOF2 varchar(10),
	GRNTOF2 varchar(10),
	XGRNTUN2 varchar(10),
	GRNTUN2 varchar(10),
	XGRNTT2 varchar(10),
	GRNTT2 varchar(10),
	XGRNTA2 varchar(10),
	GRNTA2 varchar(10),
	XGRNTN1 varchar(10),
	GRNTN1 varchar(10),
	XGRNTON1 varchar(10),
	GRNTON1 varchar(10),
	XGRNTWF1 varchar(10),
	GRNTWF1 varchar(10),
	XGRNTOF1 varchar(10),
	GRNTOF1 varchar(10),
	XGRNTUN1 varchar(10),
	GRNTUN1 varchar(10),
	XGRNTT1 varchar(10),
	GRNTT1 varchar(10),
	XGRNTA1 varchar(10),
	GRNTA1 varchar(10),
	XGRNTN0 varchar(10),
	GRNTN0 varchar(10),
	XGRNTON0 varchar(10),
	GRNTON0 varchar(10),
	XGRNTWF0 varchar(10),
	GRNTWF0 varchar(10),
	XGRNTOF0 varchar(10),
	GRNTOF0 varchar(10),
	XGRNTUN0 varchar(10),
	GRNTUN0 varchar(10),
	XGRNTT0 varchar(10),
	GRNTT0 varchar(10),
	XGRNTA0 varchar(10),
	GRNTA0 varchar(10),
	XGRN4N2 varchar(10),
	GRN4N2 varchar(10),
	XGRN4ON2 varchar(10),
	GRN4ON2 varchar(10),
	XGRN4OF2 varchar(10),
	GRN4OF2 varchar(10),
	XGRN4WF2 varchar(10),
	GRN4WF2 varchar(10),
	XGRN4UN2 varchar(10),
	GRN4UN2 varchar(10),
	XGRN4G2 varchar(10),
	GRN4G2 varchar(10),
	XGRN4T2 varchar(10),
	GRN4T2 varchar(10),
	XGRN4A2 varchar(10),
	GRN4A2 varchar(10),
	XGRN4N12 varchar(10),
	GRN4N12 varchar(10),
	XGRN4G12 varchar(10),
	GRN4G12 varchar(10),
	XGRN4T12 varchar(10),
	GRN4T12 varchar(10),
	XGRN4A12 varchar(10),
	GRN4A12 varchar(10),
	XGRN4N22 varchar(10),
	GRN4N22 varchar(10),
	XGRN4G22 varchar(10),
	GRN4G22 varchar(10),
	XGRN4T22 varchar(10),
	GRN4T22 varchar(10),
	XGRN4A22 varchar(10),
	GRN4A22 varchar(10),
	XGRN4N32 varchar(10),
	GRN4N32 varchar(10),
	XGRN4G32 varchar(10),
	GRN4G32 varchar(10),
	XGRN4T32 varchar(10),
	GRN4T32 varchar(10),
	XGRN4A32 varchar(10),
	GRN4A32 varchar(10),
	XGRN4N42 varchar(10),
	GRN4N42 varchar(10),
	XGRN4G42 varchar(10),
	GRN4G42 varchar(10),
	XGRN4T42 varchar(10),
	GRN4T42 varchar(10),
	XGRN4A42 varchar(10),
	GRN4A42 varchar(10),
	XGRN4N52 varchar(10),
	GRN4N52 varchar(10),
	XGRN4G52 varchar(10),
	GRN4G52 varchar(10),
	XGRN4T52 varchar(10),
	GRN4T52 varchar(10),
	XGRN4A52 varchar(10),
	GRN4A52 varchar(10),
	XGRN4N1 varchar(10),
	GRN4N1 varchar(10),
	XGRN4ON1 varchar(10),
	GRN4ON1 varchar(10),
	XGRN4OF1 varchar(10),
	GRN4OF1 varchar(10),
	XGRN4WF1 varchar(10),
	GRN4WF1 varchar(10),
	XGRN4UN1 varchar(10),
	GRN4UN1 varchar(10),
	XGRN4G1 varchar(10),
	GRN4G1 varchar(10),
	XGRN4T1 varchar(10),
	GRN4T1 varchar(10),
	XGRN4A1 varchar(10),
	GRN4A1 varchar(10),
	XGRN4N11 varchar(10),
	GRN4N11 varchar(10),
	XGRN4G11 varchar(10),
	GRN4G11 varchar(10),
	XGRN4T11 varchar(10),
	GRN4T11 varchar(10),
	XGRN4A11 varchar(10),
	GRN4A11 varchar(10),
	XGRN4N21 varchar(10),
	GRN4N21 varchar(10),
	XGRN4G21 varchar(10),
	GRN4G21 varchar(10),
	XGRN4T21 varchar(10),
	GRN4T21 varchar(10),
	XGRN4A21 varchar(10),
	GRN4A21 varchar(10),
	XGRN4N31 varchar(10),
	GRN4N31 varchar(10),
	XGRN4G31 varchar(10),
	GRN4G31 varchar(10),
	XGRN4T31 varchar(10),
	GRN4T31 varchar(10),
	XGRN4A31 varchar(10),
	GRN4A31 varchar(10),
	XGRN4N41 varchar(10),
	GRN4N41 varchar(10),
	XGRN4G41 varchar(10),
	GRN4G41 varchar(10),
	XGRN4T41 varchar(10),
	GRN4T41 varchar(10),
	XGRN4A41 varchar(10),
	GRN4A41 varchar(10),
	XGRN4N51 varchar(10),
	GRN4N51 varchar(10),
	XGRN4G51 varchar(10),
	GRN4G51 varchar(10),
	XGRN4T51 varchar(10),
	GRN4T51 varchar(10),
	XGRN4A51 varchar(10),
	GRN4A51 varchar(10),
	XGRN4N0 varchar(10),
	GRN4N0 varchar(10),
	XGRN4ON0 varchar(10),
	GRN4ON0 varchar(10),
	XGRN4OF0 varchar(10),
	GRN4OF0 varchar(10),
	XGRN4WF0 varchar(10),
	GRN4WF0 varchar(10),
	XGRN4UN0 varchar(10),
	GRN4UN0 varchar(10),
	XGRN4G0 varchar(10),
	GRN4G0 varchar(10),
	XGRN4T0 varchar(10),
	GRN4T0 varchar(10),
	XGRN4A0 varchar(10),
	GRN4A0 varchar(10),
	XGRN4N10 varchar(10),
	GRN4N10 varchar(10),
	XGRN4G10 varchar(10),
	GRN4G10 varchar(10),
	XGRN4T10 varchar(10),
	GRN4T10 varchar(10),
	XGRN4A10 varchar(10),
	GRN4A10 varchar(10),
	XGRN4N20 varchar(10),
	GRN4N20 varchar(10),
	XGRN4G20 varchar(10),
	GRN4G20 varchar(10),
	XGRN4T20 varchar(10),
	GRN4T20 varchar(10),
	XGRN4A20 varchar(10),
	GRN4A20 varchar(10),
	XGRN4N30 varchar(10),
	GRN4N30 varchar(10),
	XGRN4G30 varchar(10),
	GRN4G30 varchar(10),
	XGRN4T30 varchar(10),
	GRN4T30 varchar(10),
	XGRN4A30 varchar(10),
	GRN4A30 varchar(10),
	XGRN4N40 varchar(10),
	GRN4N40 varchar(10),
	XGRN4G40 varchar(10),
	GRN4G40 varchar(10),
	XGRN4T40 varchar(10),
	GRN4T40 varchar(10),
	XGRN4A40 varchar(10),
	GRN4A40 varchar(10),
	XGRN4N50 varchar(10),
	GRN4N50 varchar(10),
	XGRN4G50 varchar(10),
	GRN4G50 varchar(10),
	XGRN4T50 varchar(10),
	GRN4T50 varchar(10),
	XGRN4A50 varchar(10),
	GRN4A50 varchar(10),
	XNPGRN2 varchar(10),
	NPGRN2 varchar(10),
	XNPGRN1 varchar(10),
	NPGRN1 varchar(10),
	XNPGRN0 varchar(10),
	NPGRN0 varchar(10),
	XNPT412 varchar(10),
	NPT412 varchar(10),
	XNPT422 varchar(10),
	NPT422 varchar(10),
	XNPT432 varchar(10),
	NPT432 varchar(10),
	XNPT442 varchar(10),
	NPT442 varchar(10),
	XNPT452 varchar(10),
	NPT452 varchar(10),
	XNPT411 varchar(10),
	NPT411 varchar(10),
	XNPT421 varchar(10),
	NPT421 varchar(10),
	XNPT431 varchar(10),
	NPT431 varchar(10),
	XNPT441 varchar(10),
	NPT441 varchar(10),
	XNPT451 varchar(10),
	NPT451 varchar(10),
	XNPT410 varchar(10),
	NPT410 varchar(10),
	XNPT420 varchar(10),
	NPT420 varchar(10),
	XNPT430 varchar(10),
	NPT430 varchar(10),
	XNPT440 varchar(10),
	NPT440 varchar(10),
	XNPT450 varchar(10),
	NPT450 varchar(10)
);
\copy sfa FROM '../unicsvtest/sfa1213.csv' WITH ( FORMAT CSV, HEADER, QUOTE '"', ENCODING 'LATIN1' ) ;

CREATE TABLE tuitstats AS
	SELECT unitid,NPIS412,NPIS422,NPIS432,NPIS442,NPIS452,NPIS411,NPIS421,NPIS431,NPIS441,NPIS451,NPIS410,NPIS420,NPIS430,NPIS440,NPIS450
	FROM sfa;
