package com.company.wfstpdemo.web.ticket;

import com.company.wfstpdemo.entity.Ticket;
import com.groupstp.workflowstp.entity.Workflow;
import com.groupstp.workflowstp.entity.WorkflowInstanceTask;
import com.groupstp.workflowstp.service.WorkflowService;
import com.groupstp.workflowstp.web.bean.WorkflowWebBean;
import com.haulmont.cuba.core.global.PersistenceHelper;
import com.haulmont.cuba.core.global.UserSessionSource;
import com.haulmont.cuba.gui.ComponentsHelper;
import com.haulmont.cuba.gui.components.AbstractEditor;
import com.haulmont.cuba.gui.components.DatasourceComponent;
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


    @Override
    public void ready() {
        super.ready();

        initWorkflowExtension();
        setShowSaveNotification(false);
    }

    private void initWorkflowExtension() {
        if (!PersistenceHelper.isNew(getItem())) {
            //задача не новая, проверим в рабочем ли процессе она
            Workflow workflow = workflowService.getWorkflow(getItem());
            if (workflow != null) {
                //для обрабатываемых задач выключаем все редактирование
                disableFields();

                WorkflowInstanceTask task = workflowService.getWorkflowInstanceTask(getItem());
                if (task != null) {//текущая выполняемая задача по шагу
                    if (!workflowWebBean.isActor(userSessionSource.getUserSession().getUser(), task.getStep().getStage())) {
                        //пользователь не участник шага - закрываем экран с запретом доступа
                        closeWithAccessDenied();
                        return;
                    }
                    try {
                        //расширяем экран согласно задаче по шагу
                        workflowWebBean.extendEditor(getItem(), this, task);
                    } catch (Exception e) {
                        closeWithLog(getMessage("ticketEdit.error.extensionFailed"), e);
                    }
                }
            }
        }
    }

    private void disableFields() {
        ComponentsHelper.walkComponents(this, (component, name) -> {
            if (component instanceof DatasourceComponent)
                ((DatasourceComponent) component).setEditable(false);
        });
    }

    private void closeWithAccessDenied() {
        showNotification(getMessage("ticketEdit.error.accessDenied"), NotificationType.ERROR);
        close(CLOSE_ACTION_ID, true);
    }

    private void closeWithLog(String message, Exception e) {
        log.error(message, e);
        showNotification(message, NotificationType.ERROR);
        close(CLOSE_ACTION_ID, true);
    }
}