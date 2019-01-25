-- begin WFSTPDEMO_TICKET
create table WFSTPDEMO_TICKET (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(500) not null,
    DESCRIPTION varchar(2000) not null,
    URGENT boolean,
    STEP_NAME varchar(255),
    WORKFLOW_ID varchar(36),
    STATUS integer,
    --
    primary key (ID)
)^
-- end WFSTPDEMO_TICKET
