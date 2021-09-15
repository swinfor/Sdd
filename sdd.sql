

create sequence seq_background_queries nocache ;
create sequence seq_users_sql_activities nocache ;
create sequence seq_log_messages nocache ;

CREATE TABLE DATABASES(
	DATABASE_NAME varchar2(17) NOT NULL,
	HOST_NAME varchar2(17) NOT NULL,
	DATABASE_TYPE number(1) DEFAULT 1,
	STATUS char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT databases_pk PRIMARY KEY  
(
	DATABASE_NAME  ,
	HOST_NAME  
)
) 
;
CREATE TABLE ENVIRONMENTS(
	environment_name varchar2(15) NOT NULL,
	description varchar2(50) NULL,
	theme varchar2(25) NULL,
	daemon_status char(1) default 'N',
	background_query_timeout number(6) default 45,
	block_background_query_sql char(1) default 'N',
	suspend_pending_queries char(1) default 'N',
	download_allowed char(1) default 'Y',
	status char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT ENVIRONMENTS_pk PRIMARY KEY  
(
	environment_name  
)
) 
;
CREATE TABLE ENVIRONMENTS_HOSTNAMES(
	environment_name varchar2(15) not NULL,
	host_name varchar2(17) not NULL,
	status char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT environments_hostnames_pk PRIMARY KEY  
(
	environment_name, host_name 
)
) 
;
CREATE TABLE HOSTNAMES(
	host_name varchar2(17) NOT NULL,
	server_name varchar2(100) NOT NULL,
	limit_Concurrent_Users number(4) NULL,
	number_Of_Background_Queries number(2) DEFAULT 1,
	max_Number_Of_Records_Returned number(6) DEFAULT 1000,
	connection_Timeout number(4) default 5,
	result_Folder varchar2(100) NULL,
	retention_query_files number(3) default 15,
	download_allowed char(1) default 'Y',
	background_Run_All_Day char(1) default 'Y',
	status char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT hostnames_pk PRIMARY KEY  
(
	host_name  
)
) 
;
CREATE TABLE LOG_MESSAGES(
	id number(10) NOT NULL,
	MSG_DATE timestamp default systimestamp,
	MSG_TYPE varchar2(15) NULL,
	MODULE_NAME varchar2(20) NULL,
	MSG_TEXT varchar2(2000) NULL,
 CONSTRAINT MESSAGES_pk PRIMARY KEY  
(
	ID  
)
) 
;
CREATE TABLE BACKGROUND_QUERIES(
	id number(10) NOT NULL,
	USER_ID varchar2(20) NOT NULL,
	REQUESTED_DATE timestamp default systimestamp NOT NULL,
	PROCESSED_DATE timestamp NULL,
	EXECUTION_TIME number(6,2) NULL,
	END_DATE timestamp NULL,
	DATABASE_NAME varchar2(17) NULL,
	HOST_NAME varchar2(17) NULL,
	MIX_NUM number(6) NULL,
	SQL_STATEMENT varchar2(4000) NULL,
	NUMBER_OF_RETURNED_RECORDS number(6) NULL,
	MESSAGE varchar2(500) NULL,
	FILE_NAME varchar2(100) NULL,
	schedule_id number(10) NULL,
	STATUS char(1) default 'P',
	CREATION_DATE timestamp  default systimestamp,
 CONSTRAINT BACKGROUND_QUERIES_pk PRIMARY KEY  
(
	ID  
)
) 
;
CREATE TABLE ROLES(
	ROLE_NAME varchar2(30) NOT NULL,
	DESCRIPTION varchar2(200) NULL,
	NUMBER_OF_RECORDS_PER_QUERY number(6) default 1000,
	INQUIRY_UPDATE char(1) default 'I',
	CONNECTION_TIMEOUT number(4) NULL,
	STATUS char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT roles_pk PRIMARY KEY  
(
	ROLE_NAME  
)
) 
;
CREATE TABLE ROLES_DATABASES(
	ROLE_NAME varchar2(30) NOT NULL,
	DATABASE_NAME varchar2(17) NOT NULL,
	TABLE_NAME varchar2(17) NULL,
	host_name varchar2(17) NOT NULL,
	UPDATE_ALLOWED char(1) NULL,
	CREATION_DATE timestamp default systimestamp,
	STATUS char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT roles_databases_pk PRIMARY KEY  
(
	ROLE_NAME  ,
	DATABASE_NAME  ,
	host_name  
)
) 
;
CREATE TABLE SQL_STATEMENTS(
	USER_ID varchar2(20) NOT NULL,
	DESCRIPTION varchar2(500) NULL,
	QUERY_NAME varchar2(50) NOT NULL,
	DATABASE_NAME varchar2(17) NULL,
	SQL_STATEMENT varchar2(2000) NOT NULL,
	SECURITY char(1) NULL,
	STATUS char(1) default 'A',
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT sql_statements_pk PRIMARY KEY  
(
	USER_ID  ,
	QUERY_NAME  
)
) 
;
CREATE TABLE USERS(
	USER_ID varchar2(20) NOT NULL,
	NAME varchar2(40) NULL,
	EMAIL varchar2(100) NULL,
	NUMBER_OF_RECORDS_PER_QUERY int NULL,
	TYPE_ADMIN number(1) NULL,
	TYPE_BASIC number(1) NULL,
	TYPE_SUPERUSER number(1) NULL,
	TYPE_OPERATOR number(1) NULL,
	TYPE_SUPPORT number(1) NULL,
	TYPE_QUERY number(1) NULL,
	PASSWORD varchar2(40) NULL,
	INQUIRY_UPDATE char(1) NULL,
	CONNECTION_TIMEOUT int NULL,
	DOWNLOAD_ALLOWED char(1) default 'Y',
	LAST_ACCESS_DATE timestamp NULL,
	LAST_ACCESS_IP varchar2(20) NULL,
	STATUS char(1) NULL,
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT users_pk PRIMARY KEY  
(
	USER_ID  
)
) 
;
CREATE TABLE USERS_ACTIVITIES(
	USER_ID varchar2(20) NOT NULL,
	ACTIVITY_DATE timestamp default systimestamp NOT null ,
	NUMBER_OF_PROCESSED_QUERIES number(6) NULL,
	TIME_OF_PROCESSED_QUERIES number(10,3) NULL,
	NUMBER_OF_RETURNED_RECORDS number(12) NULL,
 CONSTRAINT users_activities_pk PRIMARY KEY  
(
	USER_ID  ,
	ACTIVITY_DATE  
)
) 
;

CREATE TABLE USERS_ENVIRONMENTS(
	USER_ID varchar2(20) NOT NULL,
	environment_name varchar2(15) NOT NULL,
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT users_environments_pk PRIMARY KEY  
(
	USER_ID  ,
	environment_name  
)
) 
;

CREATE TABLE USERS_ROLES(
	USER_ID varchar2(20) NOT NULL,
	ROLE_NAME varchar2(30) NOT NULL,
	UPDATE_ALLOWED char(1) NULL,
	STATUS char(1) NULL,
	UPDATED_DATE timestamp default systimestamp,
	WHO varchar2(20) NULL,
 CONSTRAINT users_roles_pk PRIMARY KEY  
(
	USER_ID  ,
	ROLE_NAME  
)
) 
;
CREATE TABLE USERS_SQL_ACTIVITIES(
	id number(10) NOT NULL,
	USER_ID varchar2(20) NULL,
	ACTIVITY_DATE timestamp NULL,
	SQL_STATEMENT varchar2(4000) NULL,
	EXECUTION_TIME number(6,2) NULL,
	NUMBER_OF_RETURNED_RECORDS number(12) NULL,
	MESSAGE varchar2(100) NULL,
	DATABASE_NAME varchar2(17) NULL,
	HOST_NAME varchar2(17) NULL,
	REASON varchar2(500) NULL,
 CONSTRAINT users_sql_activities_pk PRIMARY KEY  
(
	ID  
)
) 
;


create or replace TRIGGER t_log_messages BEFORE UPDATE OR INSERT ON log_messages FOR EACH ROW 
BEGIN
     if :new.id is null then
		SELECT SEQ_LOG_MESSAGES.NEXTVAL INTO :NEW.id FROM DUAL;
     end if;
    :NEW.MSG_DATE:=SYSTIMESTAMP;
END;
/
create or replace TRIGGER t_background_queries BEFORE UPDATE OR INSERT ON background_queries FOR EACH ROW 
BEGIN
  IF INSERTING then
     if :new.id is null then
		SELECT SEQ_BACKGROUND_QUERIES.NEXTVAL INTO :NEW.id FROM DUAL;
     end if;
     :NEW.creation_date:=SYSTIMESTAMP;
  END IF;
END;
/
create or replace TRIGGER t_users_sql_activities BEFORE UPDATE OR INSERT ON users_sql_activities FOR EACH ROW 
BEGIN
  IF INSERTING then
     if :new.id is null then
		SELECT SEQ_USERS_SQL_ACTIVITIES.NEXTVAL INTO :NEW.id FROM DUAL;
     end if;
     :NEW.ACTIVITY_DATE:=SYSTIMESTAMP;
  END IF;
END;
/

insert into users (
USER_ID
,NAME
,EMAIL
,NUMBER_OF_RECORDS_PER_QUERY
,INQUIRY_UPDATE
,CONNECTION_TIMEOUT
,LAST_ACCESS_DATE
,LAST_ACCESS_IP
,UPDATED_DATE
,STATUS
,WHO
,TYPE_BASIC
,TYPE_SUPERUSER
,TYPE_OPERATOR
,TYPE_SUPPORT
,TYPE_QUERY
,PASSWORD
) values ( 
'ADMIN'
,'ADMINISTRATOR'
,''
,100
,'I'
,5
,null
,null
,systimestamp
,'A'
,null
,1
,1
,1
,1
,1
,'pw8rl+hGG2IU6EJke2y4nQ=='
)
;

commit;



CREATE   INDEX LOG_MESSAGES_i1 ON LOG_MESSAGES
(    
	MSG_DATE ASC,
	MSG_TYPE ASC
)
;
CREATE   INDEX MESSAGES_i2 ON LOG_MESSAGES
(
	MSG_TYPE ASC,
	MSG_DATE ASC
)
;
CREATE   INDEX BACKGROUND_QUERIES_i1 ON BACKGROUND_QUERIES
(
	USER_ID ASC,
	REQUESTED_DATE ASC
)
;
CREATE   INDEX users_sql_activities_i1 ON USERS_SQL_ACTIVITIES
(
	USER_ID ASC,
	ACTIVITY_DATE ASC
)
;
CREATE   INDEX users_sql_activities_i2 ON USERS_SQL_ACTIVITIES
(
	ACTIVITY_DATE ASC,
	USER_ID ASC
)
;

ALTER TABLE users_environments    ADD  CONSTRAINT users_environments_fk1 FOREIGN KEY(environment_name)
REFERENCES environments (environment_name)
;
ALTER TABLE users_environments    ADD  CONSTRAINT users_environments_fk2 FOREIGN KEY(user_id)
REFERENCES users (user_id)
;

ALTER TABLE environments_hostnames    ADD  CONSTRAINT environments_hostnames_fk1 FOREIGN KEY(environment_name)
REFERENCES environments (environment_name)
;
ALTER TABLE environments_hostnames    ADD  CONSTRAINT environments_hostnames_fk2 FOREIGN KEY(host_name)
REFERENCES hostnames (host_name)
;
ALTER TABLE ROLES_DATABASES    ADD  CONSTRAINT ROLES_databases_fk1 FOREIGN KEY(DATABASE_NAME, host_name)
REFERENCES DATABASES (DATABASE_NAME, HOST_NAME)
;
ALTER TABLE ROLES_DATABASES    ADD  CONSTRAINT ROLES_databases_fk2 FOREIGN KEY(ROLE_NAME)
REFERENCES ROLES (ROLE_NAME)
;
ALTER TABLE USERS_SQL_ACTIVITIES    ADD  CONSTRAINT users_activities_fk1 FOREIGN KEY(USER_ID)
REFERENCES USERS (USER_ID)
;
ALTER TABLE USERS_ROLES    ADD  CONSTRAINT users_ROLES_fk1 FOREIGN KEY(USER_ID)
REFERENCES USERS (USER_ID)
;
ALTER TABLE USERS_ROLES    ADD  CONSTRAINT users_ROLES_fk2 FOREIGN KEY(ROLE_NAME)
REFERENCES ROLES (ROLE_NAME)
;

ALTER TABLE DATABASES ADD  CONSTRAINT databases_chk_status CHECK  ((status='A' OR status='S' OR status='D'))
;
ALTER TABLE LOG_MESSAGES  ADD  CONSTRAINT MESSAGES_chk_status CHECK  ((MSG_TYPE='ERROR' OR MSG_TYPE='INFORMATION' OR MSG_TYPE='SUCCESS' OR MSG_TYPE='WARNING'))
;
ALTER TABLE BACKGROUND_QUERIES ADD  CONSTRAINT OFFLINE_QUERIES_chk_status CHECK  ((status='S' OR status='P' OR status='R' OR status='C' OR status='K' OR status='A'))
;
ALTER TABLE ROLES  ADD  CONSTRAINT ROLES_chk_status CHECK  ((STATUS='A' OR STATUS='S' OR STATUS='D'))
;
ALTER TABLE ROLES_DATABASES  ADD  CONSTRAINT ROLES_databases_chk_status CHECK  ((status='A' OR status='S' OR status='D'))
;
ALTER TABLE SQL_STATEMENTS  ADD  CONSTRAINT sql_statements_chk_security CHECK  ((security='P' OR security='R'))
;
ALTER TABLE SQL_STATEMENTS  ADD  CONSTRAINT sql_statements_chk_status CHECK  ((status='A' OR status='S' OR status='D'))
;
ALTER TABLE USERS  ADD  CONSTRAINT users_chk_status CHECK  ((status='A' OR status='S' OR status='D'))
;
ALTER TABLE USERS_ROLES  ADD  CONSTRAINT users_ROLES_chk_status CHECK  ((status='A' OR status='S' OR status='D'))
;
