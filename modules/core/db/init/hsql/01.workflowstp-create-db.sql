-- begin WFSTP_SCREEN_EXTENSION_TEMPLATE
create table WFSTP_SCREEN_EXTENSION_TEMPLATE (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    KEY_ varchar(255) not null,
    ENTITY_NAME varchar(255) not null,
    SCREEN_ID varchar(255) not null,
    IS_BROWSER boolean,
    SCREEN_CONSTRUCTOR longvarchar not null,
    --
    primary key (ID)
)^
-- end WFSTP_SCREEN_EXTENSION_TEMPLATE
-- begin WFSTP_WORKFLOW_DEFINITION
create table WFSTP_WORKFLOW_DEFINITION (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    ENTITY_NAME varchar(255) not null,
    WORKFLOW_ID varchar(36) not null,
    PRIORITY_ integer not null,
    CONDITION_SQL_SCRIPT longvarchar,
    CONDITION_XML longvarchar,
    CONDITION_GROOVY_SCRIPT longvarchar,
    --
    primary key (ID)
)^
-- end WFSTP_WORKFLOW_DEFINITION
-- begin WFSTP_SCREEN_ACTION_TEMPLATE
create table WFSTP_SCREEN_ACTION_TEMPLATE (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    ENTITY_NAME varchar(255),
    ALWAYS_ENABLED boolean,
    CAPTION varchar(255) not null,
    ICON varchar(255) not null,
    STYLE varchar(255),
    SHORTCUT varchar(255),
    BUTTON_ACTION boolean,
    SCRIPT longvarchar not null,
    PERMIT_REQUIRED boolean,
    PERMIT_ITEMS_COUNT integer,
    PERMIT_ITEMS_TYPE integer,
    PERMIT_SCRIPT longvarchar,
    --
    primary key (ID)
)^
-- end WFSTP_SCREEN_ACTION_TEMPLATE
-- begin WFSTP_STAGE
create table WFSTP_STAGE (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    ENTITY_NAME varchar(255) not null,
    TYPE integer not null,
    EXECUTION_GROOVY_SCRIPT longvarchar,
    BROWSE_SCREEN_GROOVY_SCRIPT longvarchar,
    BROWSER_SCREEN_CONSTRUCTOR longvarchar,
    EDITOR_SCREEN_GROOVY_SCRIPT longvarchar,
    EDITOR_SCREEN_CONSTRUCTOR longvarchar,
    SCREEN_CONSTRUCTOR longvarchar,
    DIRECTION_VARIABLES longvarchar,
    --
    primary key (ID)
)^
-- end WFSTP_STAGE
-- begin WFSTP_STEP
create table WFSTP_STEP (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    ORDER_ integer,
    START boolean,
    STAGE_ID varchar(36) not null,
    WORKFLOW_ID varchar(36) not null,
    --
    primary key (ID)
)^
-- end WFSTP_STEP
-- begin WFSTP_WORKFLOW_INSTANCE_COMMENT
create table WFSTP_WORKFLOW_INSTANCE_COMMENT (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    INSTANCE_ID varchar(36),
    TASK_ID varchar(36),
    AUTHOR_ID varchar(36),
    COMMENT longvarchar,
    ATTACHMENT_ID varchar(36),
    --
    primary key (ID)
)^
-- end WFSTP_WORKFLOW_INSTANCE_COMMENT
-- begin WFSTP_WORKFLOW_INSTANCE
create table WFSTP_WORKFLOW_INSTANCE (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    WORKFLOW_ID varchar(36) not null,
    ENTITY_NAME varchar(255) not null,
    ENTITY_ID varchar(255) not null,
    CONTEXT longvarchar,
    START_DATE timestamp,
    END_DATE timestamp,
    ERROR_ longvarchar,
    ERROR_IN_TASK boolean,
    --
    primary key (ID)
)^
-- end WFSTP_WORKFLOW_INSTANCE
-- begin WFSTP_WORKFLOW
create table WFSTP_WORKFLOW (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    CODE varchar(10) not null,
    ACTIVE boolean,
    ENTITY_NAME varchar(255) not null,
    ORDER_ integer,
    --
    primary key (ID)
)^
-- end WFSTP_WORKFLOW
-- begin WFSTP_SCREEN_TABLE_COLUMN_TEMPLATE
create table WFSTP_SCREEN_TABLE_COLUMN_TEMPLATE (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255) not null,
    ENTITY_NAME varchar(255),
    CAPTION varchar(255) not null,
    COLUMN_ID varchar(255) not null,
    GENERATOR_SCRIPT longvarchar not null,
    EDITABLE boolean,
    --
    primary key (ID)
)^
-- end WFSTP_SCREEN_TABLE_COLUMN_TEMPLATE
-- begin WFSTP_STEP_DIRECTION
create table WFSTP_STEP_DIRECTION (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    ORDER_ integer,
    FROM_ID varchar(36) not null,
    TO_ID varchar(36) not null,
    CONDITION_SQL_SCRIPT longvarchar,
    CONDITION_XML longvarchar,
    CONDITION_GROOVY_SCRIPT longvarchar,
    --
    primary key (ID)
)^
-- end WFSTP_STEP_DIRECTION
-- begin WFSTP_WORKFLOW_INSTANCE_TASK
create table WFSTP_WORKFLOW_INSTANCE_TASK (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    INSTANCE_ID varchar(36) not null,
    STEP_ID varchar(36) not null,
    START_DATE timestamp,
    END_DATE timestamp,
    PERFORMER_ID varchar(36),
    --
    primary key (ID)
)^
-- end WFSTP_WORKFLOW_INSTANCE_TASK
-- begin WFSTP_STAGE_ACTORS_LINK
create table WFSTP_STAGE_ACTORS_LINK (
    STAGE_ID varchar(36) not null,
    ACTOR_ID varchar(36) not null,
    primary key (STAGE_ID, ACTOR_ID)
)^

-- end WFSTP_STAGE_ACTORS_LINK
-- begin WFSTP_STAGE_VIEWERS_ROLES_LINK
create table WFSTP_STAGE_VIEWERS_ROLES_LINK (
    STAGE_ID varchar(36) not null,
    VIEWER_ROLE_ID varchar(36) not null,
    primary key (STAGE_ID, VIEWER_ROLE_ID)
)^

-- end WFSTP_STAGE_VIEWERS_ROLES_LINK
-- begin WFSTP_STAGE_ACTORS_ROLES_LINK
create table WFSTP_STAGE_ACTORS_ROLES_LINK (
    STAGE_ID varchar(36) not null,
    ACTOR_ROLE_ID varchar(36) not null,
    primary key (STAGE_ID, ACTOR_ROLE_ID)
)^

-- end WFSTP_STAGE_ACTORS_ROLES_LINK
-- begin WFSTP_STAGE_VIEWERS_LINK
create table WFSTP_STAGE_VIEWERS_LINK (
    STAGE_ID varchar(36) not null,
    VIEWER_ID varchar(36) not null,
    primary key (STAGE_ID, VIEWER_ID)
)^

-- end WFSTP_STAGE_VIEWERS_LINK
