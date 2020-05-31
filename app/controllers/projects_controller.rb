class ProjectsController < ApplicationController

    def index
        @projects = Project.all
        render json: @projects, include: [:tasks, :client, :payment_method, :status]
    end

    def show
        @project = Project.find(params[:id])
        render json: @project, include: :tasks
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
            job_number: params[:job_number],
            status_id: status.id,
            address1: params[:address1],
            address2: params[:address2],
            city: params[:city],
            project_description: params[:project_description],
            payment_method_id: payment_method.id,
            client_id: client.id,
            budget: params[:budget],
            contract_date: params[:contract_date],
            st_contract_received_date: params[:st_contract_received_date],
            framing_due_date: params[:framing_due_date],
            foundation_due_date: params[:foundation_due_date],
            email_from_dwg_received_date: params[:email_from_dwg_received_date],
            contract_proposal_sent_date: params[:contract_proposal_sent_date],
            ready_to_be_invoiced: params[:ready_to_be_invoiced]
        )

        render json: @project
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
            ready_to_be_invoiced: params[:ready_to_be_invoiced]
        )

        render json: @project
    end

end
