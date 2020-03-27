class ProjectTasksController < ApplicationController

    def get_tasks(task_category_name)
        cat_id = TaskCategory.find_by(value: task_category_name).id
        task_list = Task.select {|task| task.task_category_id == cat_id}
        task_list.map { |task| 
            @project_task = ProjectTask.create(
                project_id: @project.id,
                task_id: task.id,
                completed: false,
                completed_date: nil
            )
        }
    end

    def index
        @project_tasks = ProjectTask.all
        render json: @project_tasks, include: :task
    end

    def create
        status_value = StatusValue.find_by(value: params[:status])
        payment_method_value = PaymentMethodValue.find_by(value: params[:paymentMethodValue])
        
        if Client.find_by(name: params[:client])
            client = Client.find_by(name: params[:client])
        else
            client = Client.create(name: params[:client])
        end

        @project = Project.create(
            job_number: params[:jobNumber],
            status_value_id: status_value.id,
            address1: params[:address1],
            address2: params[:address2],
            city: params[:city],
            project_description: params[:projectDescription],
            payment_method_value_id: payment_method_value.id,
            client_id: client.id,
            budget: params[:budget],
            contract_date: params[:contractDate],
            st_contract_received_date: params[:stContractReceivedDate],
            framing_due_date: params[:framingDueDate],
            foundation_due_date: params[:foundationDueDate],
            email_from_dwg_received_date: params[:emailFromDwgReceivedDate],
            contract_proposal_sent_date: params[:contractProposalSentDate],
            ready_to_be_invoiced: params[:readyToBeInvoiced]
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
        @project_task = ProjectTask.find(params[:id])
        @project_task.update(
            project_id: params[:project_id],
            task_id: params[:task_id],
            completed: params[:completed],
            completed_date: params[:completed_date]
        )
        render json: @project_task, json: ProjectTask.find(params[:id]), status: :accepted
    end


end
