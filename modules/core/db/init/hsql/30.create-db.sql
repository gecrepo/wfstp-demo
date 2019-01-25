update SEC_USER
set VERSION=1, CREATE_TS='2019-01-25 18:39:57', CREATED_BY=null, UPDATE_TS='2019-01-25 18:41:37', UPDATED_BY='admin', DELETE_TS=null, DELETED_BY=null, LOGIN='admin', LOGIN_LC='admin', PASSWORD='cc2229d1b8a052423d9e1c9ef0113b850086586a', NAME='Administrator', FIRST_NAME=null, LAST_NAME=null, MIDDLE_NAME=null, POSITION_=null, EMAIL=null, LANGUAGE_='ru', TIME_ZONE=null, TIME_ZONE_AUTO=null, ACTIVE=true, CHANGE_PASSWORD_AT_LOGON=null, GROUP_ID='0fa2b1a5-1d68-4d69-9fbd-dff348347f93', IP_MASK=null
where ID='60885987-1b61-4247-94c7-dff348347f93';

insert into WFSTP_STAGE
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, ENTITY_NAME, TYPE, EXECUTION_GROOVY_SCRIPT, BROWSE_SCREEN_GROOVY_SCRIPT, BROWSER_SCREEN_CONSTRUCTOR, EDITOR_SCREEN_GROOVY_SCRIPT, EDITOR_SCREEN_CONSTRUCTOR, SCREEN_CONSTRUCTOR, DIRECTION_VARIABLES)
values ('5cef1f9d-e347-82eb-6678-b3fa8ee5b673', 1, '2019-01-25 00:01:38', 'admin', '2019-01-25 00:07:51', 'admin', null, null, 'Выполнение', 'wfstpdemo$Ticket', 1, null, null, null, null, '{"isBrowserScreen":false,"editorEditableFields":[{"name":"Описание","fieldId":"description"}]}', '{"isBrowserScreen":false,"actions":[{"order":1,"caption":"Готово","icon":"font-icon:CHECK","style":"friendly","buttonAction":true,"script":"import com.groupstp.workflowstp.web.workflowinstancecomment.*;\nimport com.haulmont.cuba.gui.components.Window.CloseWithCommitListener;\nimport com.groupstp.workflowstp.web.util.WebUiHelper;\nimport com.groupstp.workflowstp.web.util.MapHelper;\n\naskCommentAndFinish(MapHelper.asMap(\"выполнено\", \"да\"));\n\nprivate void askCommentAndFinish(Map params) {\n    WorkflowInstanceCommentDialog.askComment(screen, workflowInstanceTask, true)\n       .addCloseWithCommitListener(new CloseWithCommitListener() {\n           @Override\n           public void windowClosedWithCommitAction() {\n                WebUiHelper.performWorkflowAction(entity, target, workflowInstanceTask, workflowInstance, stage, screen, params);\n           }\n       });\n}","permitRequired":false},{"order":2,"caption":"Провалено","icon":"font-icon:BAN","style":"danger","script":"import com.groupstp.workflowstp.web.util.WebUiHelper;\nimport com.groupstp.workflowstp.web.util.MapHelper;\n\nWebUiHelper.performWorkflowAction(entity, target, workflowInstanceTask, workflowInstance, stage, screen, MapHelper.asMap(\"провалено\", \"да\"));"}]}', 'выполнено,провалено');

insert into WFSTP_STAGE
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, ENTITY_NAME, TYPE, EXECUTION_GROOVY_SCRIPT, BROWSE_SCREEN_GROOVY_SCRIPT, BROWSER_SCREEN_CONSTRUCTOR, EDITOR_SCREEN_GROOVY_SCRIPT, EDITOR_SCREEN_CONSTRUCTOR, SCREEN_CONSTRUCTOR, DIRECTION_VARIABLES)
values ('a62b3b62-b6c1-e136-1ab8-6a3af719d250', 1, '2019-01-25 00:02:04', 'admin', '2019-01-25 00:02:04', null, null, null, 'Выполнено', 'wfstpdemo$Ticket', 3, null, null, null, null, null, null, null);

insert into WFSTP_STAGE
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, ENTITY_NAME, TYPE, EXECUTION_GROOVY_SCRIPT, BROWSE_SCREEN_GROOVY_SCRIPT, BROWSER_SCREEN_CONSTRUCTOR, EDITOR_SCREEN_GROOVY_SCRIPT, EDITOR_SCREEN_CONSTRUCTOR, SCREEN_CONSTRUCTOR, DIRECTION_VARIABLES)
values ('ccf4cab6-e3f7-9648-bc8c-dc1ade5bf9ab', 1, '2019-01-25 00:02:17', 'admin', '2019-01-25 00:02:17', null, null, null, 'Провалено', 'wfstpdemo$Ticket', 3, null, null, null, null, null, null, null);

insert into WFSTP_STAGE_ACTORS_LINK
(STAGE_ID, ACTOR_ID)
values ('5cef1f9d-e347-82eb-6678-b3fa8ee5b673','60885987-1b61-4247-94c7-dff348347f93');

insert into WFSTP_WORKFLOW
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, NAME, CODE, ACTIVE, ENTITY_NAME, ORDER_)
values ('f210dfad-e37e-e086-e9d3-bc1f5cb59dd6', 1, '2019-01-25 00:03:11', 'admin', '2019-01-25 00:04:30', 'admin', null, null, 'Рабочий процесс задач', 'задачи_1', true, 'wfstpdemo$Ticket', 1);

insert into WFSTP_STEP
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ORDER_, START, STAGE_ID, WORKFLOW_ID)
values ('c03ea575-e607-c2e2-2a08-c93817756a5f', 1, '2019-01-25 00:03:11', 'admin', '2019-01-25 00:04:28', 'admin', null, null, 1, true, '5cef1f9d-e347-82eb-6678-b3fa8ee5b673', 'f210dfad-e37e-e086-e9d3-bc1f5cb59dd6');

insert into WFSTP_STEP
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ORDER_, START, STAGE_ID, WORKFLOW_ID)
values ('490efc79-69a6-0e0d-5f09-5a7cb86aa608', 1, '2019-01-25 00:03:11', 'admin', '2019-01-25 00:03:11', null, null, null, 2, false, 'a62b3b62-b6c1-e136-1ab8-6a3af719d250', 'f210dfad-e37e-e086-e9d3-bc1f5cb59dd6');

insert into WFSTP_STEP
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ORDER_, START, STAGE_ID, WORKFLOW_ID)
values ('7aa97e5b-48bf-416d-6dce-c45617c5f503', 1, '2019-01-25 00:03:11', 'admin', '2019-01-25 00:03:11', null, null, null, 3, false, 'ccf4cab6-e3f7-9648-bc8c-dc1ade5bf9ab', 'f210dfad-e37e-e086-e9d3-bc1f5cb59dd6');

insert into WFSTP_STEP_DIRECTION
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ORDER_, FROM_ID, TO_ID, CONDITION_SQL_SCRIPT, CONDITION_XML, CONDITION_GROOVY_SCRIPT)
values ('b6f98667-53b7-4900-7adc-3ed884b0dced', 1, '2019-01-25 00:04:28', 'admin', '2019-01-25 00:04:28', null, null, null, 1, 'c03ea575-e607-c2e2-2a08-c93817756a5f', '490efc79-69a6-0e0d-5f09-5a7cb86aa608', null, null, 'return "да".equals(context[''выполнено''])');

insert into WFSTP_STEP_DIRECTION
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ORDER_, FROM_ID, TO_ID, CONDITION_SQL_SCRIPT, CONDITION_XML, CONDITION_GROOVY_SCRIPT)
values ('33098f26-3a86-ef42-2369-72eb37089522', 1, '2019-01-25 00:04:28', 'admin', '2019-01-25 00:04:28', null, null, null, 2, 'c03ea575-e607-c2e2-2a08-c93817756a5f', '7aa97e5b-48bf-416d-6dce-c45617c5f503', null, null, 'return "да".equals(context[''провалено''])');

insert into WFSTP_WORKFLOW_DEFINITION
(ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, ENTITY_NAME, WORKFLOW_ID, PRIORITY_, CONDITION_SQL_SCRIPT, CONDITION_XML, CONDITION_GROOVY_SCRIPT)
values ('2167b0f0-0568-ea55-0d06-b8d3c4150fa0', 1, '2019-01-25 00:04:53', 'admin', '2019-01-25 00:04:53', null, null, null, 'wfstpdemo$Ticket', 'f210dfad-e37e-e086-e9d3-bc1f5cb59dd6', 10, null, null, 'return true;');
