package com.company.wfstpdemo.web.ticket;

import com.company.wfstpdemo.entity.Ticket;
import com.groupstp.workflowstp.entity.Workflow;
import com.groupstp.workflowstp.entity.WorkflowInstanceTask;
import com.groupstp.workflowstp.service.WorkflowService;
import com.groupstp.workflowstp.web.bean.WorkflowWebBean;
import com.haulmont.cuba.core.global.PersistenceHelper;
import com.haulmont.cuba.core.global.UserSessionSource;
import com.haulmont.cuba.gui.components.AbstractEditor;
import com.haulmont.cuba.gui.components.FieldGroup;
import com.haulmont.cuba.gui.components.RichTextArea;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;

/**
 * @author adiatullin
 */
public class TicketEdit extends AbstractEditor<Ticket> {

    private static final Logger log = LoggerFactory.getLogger(TicketEdit.class);

    @Inject
    private WorkflowService workflowService;
    @Inject
    private WorkflowWebBean workflowWebBean;
    @Inject
    private UserSessionSource userSessionSource;

    @Inject
    private FieldGroup fieldGroup;
    @Inject
    private RichTextArea description;


    @Override
    public void ready() {
        super.ready();

        initWorkflowExtension();
    }

    private void initWorkflowExtension() {
        if (!PersistenceHelper.isNew(getItem())) {
            //задача не новая, проверим в рабочем ли процессе она
            Workflow workflow = workflowService.getWorkflow(getItem());
            if (workflow != null) {
                //для обрабатываемых задач выключаем все редактирование
                disableControls();

                WorkflowInstanceTask task = workflowService.getWorkflowInstanceTask(getItem());
                if (task != null) {//выполняется некий шаг
                    if (!workflowWebBean.isActor(userSessionSource.getUserSession().getUser(), task.getStep().getStage())) {
                        //пользователь не участник шага - закрываем экран с запрещенным доступом
                        closeWithAccessDenied();
                        return;
                    }
                    try {
                        workflowWebBean.extendEditor(getItem(), this);
                    } catch (Exception e) {
                        closeWithException(getMessage("ticketEdit.error.extensionFailed"), e);
                    }
                }
            }
        }
    }

    private void disableControls() {
        for (FieldGroup.FieldConfig fieldConfig : fieldGroup.getFields()) {
            fieldConfig.setEditable(Boolean.FALSE);
        }
        description.setEditable(false);
    }

    private void closeWithAccessDenied() {
        showNotification(getMessage("ticketEdit.error.accessDenied"), NotificationType.ERROR);
        close(CLOSE_ACTION_ID, true);
    }

    private void closeWithException(String messageKey, Exception e) {
        log.error(messageKey, e);
        close(CLOSE_ACTION_ID, true);
        throw new RuntimeException(messageKey, e);
    }
}