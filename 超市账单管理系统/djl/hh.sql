--------------------------------------------------------
-- Export file for user SYSTEM                        --
-- Created by Administrator on 2012-8-11, ÉÏÎç 11:16:29 --
--------------------------------------------------------

spool hh.log

prompt
prompt Creating table AQ$_SCHEDULES
prompt ============================
prompt
create table SYSTEM.AQ$_SCHEDULES
(
  OID         RAW(16) not null,
  DESTINATION VARCHAR2(128) not null,
  START_TIME  DATE,
  DURATION    VARCHAR2(8),
  NEXT_TIME   VARCHAR2(128),
  LATENCY     VARCHAR2(8),
  LAST_TIME   DATE,
  JOBNO       NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.AQ$_SCHEDULES
  add constraint AQ$_SCHEDULES_PRIMARY primary key (OID, DESTINATION)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SYSTEM.AQ$_SCHEDULES
  add constraint AQ$_SCHEDULES_CHECK unique (JOBNO)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence BILL_SEQ
prompt ==========================
prompt
create sequence SYSTEM.BILL_SEQ
minvalue 1
maxvalue 10000000000000
start with 22
increment by 1
nocache;

prompt
prompt Creating sequence SUP_SEQ
prompt =========================
prompt
create sequence SYSTEM.SUP_SEQ
minvalue 1
maxvalue 55555555
start with 110
increment by 1
cache 20;

prompt
prompt Creating sequence USER_SEQ
prompt ==========================
prompt
create sequence SYSTEM.USER_SEQ
minvalue 7
maxvalue 10000000000
start with 22
increment by 1
nocache;


spool off
