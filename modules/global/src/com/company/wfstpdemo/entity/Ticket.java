package com.company.wfstpdemo.entity;

import javax.persistence.*;

import com.groupstp.workflowstp.entity.Workflow;
import com.groupstp.workflowstp.entity.WorkflowEntity;
import com.groupstp.workflowstp.entity.WorkflowEntityStatus;
import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.chile.core.annotations.NamePattern;

import java.util.UUID;

/**
 * @author adiatullin
 */
@NamePattern("%s|id")
@Table(name = "WFSTPDEMO_TICKET")
@Entity(name = "wfstpdemo$Ticket")
public class Ticket extends StandardEntity implements WorkflowEntity<UUID> {
    private static final long serialVersionUID = 7337017127753361381L;

    @Column(name = "DESCRIPTION", length = 2000)
    private String description;

    @Column(name = "URGENT")
    private Boolean urgent = false;

    @Column(name = "STEP_NAME")
    private String stepName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "WORKFLOW_ID")
    private Workflow workflow;

    @Column(name = "STATUS")
    private Integer status;


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getUrgent() {
        return urgent;
    }

    public void setUrgent(Boolean urgent) {
        this.urgent = urgent;
    }

    @Override
    public String getStepName() {
        return stepName;
    }

    @Override
    public void setStepName(String stepName) {
        this.stepName = stepName;
    }

    @Override
    public Workflow getWorkflow() {
        return workflow;
    }

    @Override
    public void setWorkflow(Workflow workflow) {
        this.workflow = workflow;
    }

    @Override
    public WorkflowEntityStatus getStatus() {
        return WorkflowEntityStatus.fromId(status);
    }

    @Override
    public void setStatus(WorkflowEntityStatus status) {
        this.status = status == null ? null : status.getId();
    }
}