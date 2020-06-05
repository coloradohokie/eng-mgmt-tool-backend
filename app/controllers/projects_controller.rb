class ProjectsController < ApplicationController

    before_action :authenticate, only: [:index]
    def index
        @projects = Project.all
        @activities = ProjectActivity.all
        #change to @projects = Project.where(owner_id: payload["user_id"])
        #once you have owner set up in the project table
        render json: {projects: @projects}, include: [:tasks, :client, :payment_method, :status]
        #, include: [:tasks, :client, :payment_method, :status]
        #change above to long form and include projectTasks, Tasks, and all other calls from App.js
    end

    def show
        @project = Project.find(params[:id])
        render json: @project, include: :tasks
    end

    def get_tasks(task_template_value)
        template_id = TaskTemplate.find_by(value: task_template_value).id
        task_list = TaskTemplateTask.select {|task_template_task| task_template_task.task_template_id == template_id}
        task_list.map { |task_template_task| 
            @project_task = Task.create(
                project_id: @project.id,
                name: task_template_task.name,
                template_name: task_template_value,
                done: false,
                active: true,
                sort_id: task_template_task.sort_id
            )
        }
    end

    def create
        status = Status.find_by(value: params[:status])
        payment_method = PaymentMethod.find_by(value: params[:paymentMethodValue])
        
        if Client.find_by(name: params[:client])
            client = Client.find_by(name: params[:client])
        else
            client = Client.create(name: params[:client])
        end

        @project = Project.create(
            job_number: params[:jobNumber],
            status_id: status.id,
            address1: params[:address1],
            address2: params[:address2],
            city: params[:city],
            project_description: params[:projectDescription],
            payment_method_id: payment_method.id,
            client_id: client.id,
            budget: params[:budget],
            contract_date: params[:contractDate],
            st_contract_received_date: params[:stContractReceivedDate],
            framing_due_date: params[:framingDueDate],
            foundation_due_date: params[:foundationDueDate],
            email_from_dwg_received_date: params[:emailFromDwgReceivedDate],
            contract_proposal_sent_date: params[:contractProposalSentDate],
            ready_to_be_invoiced: params[:readyToBeInvoiced],
            trusses_received_date: params[:trussesReceivedDate],
            last_action: "Project Created"
        )

        if params[:proposalTemplate]
            get_tasks("Proposal")
        end

        if params[:framingTemplate]
            get_tasks("Framing")
        end

        if params[:foundationTemplate]
            get_tasks("Foundation")
        end

        if (params[:framingTemplate] || params[:foundationTemplate])
            get_tasks("Main")
        end

        render json: @project, status: 200
    end

    def update
        @project = Project.find(params[:id])
        @project.update(
            job_number: params[:job_number],
            status_id: params[:status_id],
            address1: params[:address1],
            address2: params[:address2],
            city: params[:city],
            project_description: params[:project_description],
            payment_method_id: params[:payment_method_id],
            client_id: params[:client_id],
            budget: params[:budget],
            contract_date: params[:contract_date],
            st_contract_received_date: params[:st_contract_received_date],
            framing_due_date: params[:framing_due_date],
            foundation_due_date: params[:foundation_due_date],
            email_from_dwg_received_date: params[:email_from_dwg_received_date],
            contract_proposal_sent_date: params[:contract_proposal_sent_date],
            ready_to_be_invoiced: params[:ready_to_be_invoiced],
            last_action: params[:last_action]
        )

        render json: @project
    end

end
