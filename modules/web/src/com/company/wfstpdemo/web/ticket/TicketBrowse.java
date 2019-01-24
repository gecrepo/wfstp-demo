package com.company.wfstpdemo.web.ticket;

import com.company.wfstpdemo.entity.Ticket;
import com.groupstp.workflowstp.service.WorkflowService;
import com.haulmont.cuba.gui.components.AbstractLookup;
import com.haulmont.cuba.gui.components.Component;
import com.haulmont.cuba.gui.components.Table;
import com.haulmont.cuba.gui.components.actions.EditAction;
import com.haulmont.cuba.gui.components.actions.ItemTrackingAction;
import com.haulmont.cuba.gui.components.actions.RemoveAction;
import com.haulmont.cuba.gui.icons.CubaIcon;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;
import java.util.Map;

/**
 * @author adiatullin
 */
public class TicketBrowse extends AbstractLookup {

    private static final Logger log = LoggerFactory.getLogger(TicketBrowse.class);

    @Inject
    private WorkflowService workflowService;

    @Inject
    private Table<Ticket> ticketsTable;

    @Override
    public void init(Map<String, Object> params) {
        super.init(params);

        initTicketsTableActions();
    }

    private void initTicketsTableActions() {
        //действие для отправки задачи в рабочий процесс
        ticketsTable.addAction(new ItemTrackingAction("run") {
            @Override
            public String getIcon() {
                return CubaIcon.OK.source();
            }

            @Override
            public String getCaption() {
                return getMessage("ticketBrowse.start");
            }

            @Override
            public void actionPerform(Component component) {
                Ticket selected = ticketsTable.getSingleSelected();
                if (selected != null) {
                    try {
                        workflowService.startWorkflow(selected, workflowService.determinateWorkflow(selected));
                    } catch (Exception e) {
                        log.error("Failed to start ticket workflow", e);
                        showNotification(getMessage("notification.alert"),
                                String.format(getMessage("ticketBrowse.error.workflowStartFailed"), e.getMessage()),
                                NotificationType.ERROR
                        );
                    } finally {
                        ticketsTable.getDatasource().refresh();
                    }
                }
            }

            @Override
            public boolean isPermitted() {
                if (super.isPermitted()) {
                    Ticket selected = ticketsTable.getSingleSelected();
                    return selected != null && selected.getWorkflow() == null;
                }
                return true;
            }
        });
        //не даем возможность удалить задачу в случае если она есть или была в рабочем процессе
        ticketsTable.addAction(new RemoveAction(ticketsTable) {
            @Override
            public boolean isPermitted() {
                if (super.isPermitted()) {
                    Ticket selected = ticketsTable.getSingleSelected();
                    return selected != null && selected.getWorkflow() == null;
                }
                return true;
            }
        });
        //обновление таблицы после редактирования
        ((EditAction) ticketsTable.getActionNN(EditAction.ACTION_ID))
                .setAfterWindowClosedHandler((window, action) -> ticketsTable.getDatasource().refresh());
    }
}