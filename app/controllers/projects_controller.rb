class ProjectsController < ApplicationController

    def index
        @projects = Project.all
        @project_activities = ProjectActivity.all
        @statuses = Status.all
        @task_templates = TaskTemplate.all
        @activities = Activity.all
        project_list = []
        @projects.map { |project|
            project_item = {}
            project_item[:id] = project.id
            project_item[:job_number] = project.job_number
            project_item[:status_id] = project.status.id
            project_item[:address1] = project.address1
            project_item[:address2] = project.address2
            project_item[:city] = project.city
            project_item[:project_description] = project.project_description
            project_item[:payment_method_id] = project.payment_method.id
            project_item[:client_id] = project.client.id
            project_item[:budget] = project.budget
            project_item[:contract_date] = project.contract_date
            project_item[:st_contract_received_date] = project.st_contract_received_date
            project_item[:framing_due_date] = project.framing_due_date
            project_item[:foundation_due_date] = project.foundation_due_date
            project_item[:email_from_dwg_received_date] = project.email_from_dwg_received_date
            project_item[:contract_proposal_sent_date] = project.contract_proposal_sent_date
            project_item[:ready_to_be_invoiced] = project.ready_to_be_invoiced
            project_item[:trusses_received_date] = project.trusses_received_date
            project_item[:last_action] = project.last_action
            project_item[:created_at] = project.created_at
            project_item[:updated_at] = project.updated_at
            tasks = Task.select{ |task| task.project_id == project.id}
            project_item[:tasks] = tasks
            client = Client.find{ |client| client.id == project.client.id}
            project_item[:client] = client
            payment_method = PaymentMethod.find { |pm| pm.id == project.payment_method.id}
            project_item[:payment_method] = payment_method
            status = Status.find { |s| s.id == project.status.id}
            project_item[:status] = status
            project_list.push(project_item)   
        }

        render json: {projects: project_list, project_activities: @project_activities, statuses: @statuses, task_templates: @task_templates, activities: @activities}
        #change to @projects = Project.where(owner_id: payload["user_id"])
        #once you have owner set up in the project table
    end

    def show
        @project = Project.find(params[:id])
        render json: @project, include: :tasks
    end

    def create
        incoming_params = project_params.except(
            :status, 
            :payment_method_value, 
            :client,
            :proposal_template,
            :framing_template,
            :foundation_template
        )
        incoming_params[:status_id] = Status.find_by(value: project_params[:status]).id
        incoming_params[:payment_method_id] = PaymentMethod.find_by(value: project_params[:payment_method_value]).id
        incoming_params[:client_id] = Client.find_by(name: project_params[:client]) ? Client.find_by(name: project_params[:client]).id : Client.create(name: project_params[:client]).id
        incoming_params[:last_action] = "Project Created"

        @project = Project.create(incoming_params)
        get_tasks("Proposal") if project_params[:proposal_template]
        get_tasks("Framing") if project_params[:framing_template]
        get_tasks("Foundation") if project_params[:foundation_template]
        get_tasks("Main") if (project_params[:framing_template] || project_params[:foundation_template])

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

    private
    def project_params
        params.require(:project).permit(
            :job_number,
            :address1,
            :address2,
            :city,
            :status,
            :status_id,
            :payment_method_id,
            :client_id,
            :client,
            :payment_method_value,
            :project_description,
            :budget,
            :contract_date,
            :st_contract_received_date,
            :trusses_received_date,
            :framing_due_date,
            :foundation_due_date,
            :email_from_dwg_received_date,
            :contract_proposal_sent_date,
            :ready_to_be_invoiced,
            :proposal_template,
            :foundation_template,
            :framing_template,
            :last_action
        )
    end

    def get_tasks(task_template_value)
        template_id = TaskTemplate.find_by(value: task_template_value).id
        task_list = TaskTemplateTask.select {|task_template_task| task_template_task.task_template_id == template_id}
        task_list.map { |task_template_task| 
            Task.create(
                project_id: @project.id,
                name: task_template_task.name,
                template_name: task_template_value,
                done: false,
                active: true,
                sort_id: task_template_task.sort_id
            )
        }
    end

end
