# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#destroy_all joins first

ProjectTask.destroy_all
Task.destroy_all
Activity.destroy_all
Project.destroy_all

Client.destroy_all
StatusValue.destroy_all
PaymentMethodValue.destroy_all
ActivityValue.destroy_all
TaskCategory.destroy_all

client1 = Client.create({name:"John Roebling", phone:"212-231-3324", email:"jroebling@brooklyn.us"})
client2 = Client.create({name:"Louis Skidmore", phone: "312-554-9090", email: "Louis@som.com"})

status1 = StatusValue.create({value:"Proposed", sort_id:1, active:true})
status2 = StatusValue.create({value:"Open", sort_id:2, active:true})
status3 = StatusValue.create({value:"On Hold", sort_id:3, active:true})
status4 = StatusValue.create({value:"Completed", sort_id:4, active:true})

payment1 = PaymentMethodValue.create({value:"Cash on Delivery", sort_id:1, active:true})
payment2 = PaymentMethodValue.create({value:"Credit", sort_id:2, active:true})

activity_value1 = ActivityValue.create({value: "Phone Call", sort_id:1, active: true })
activity_value2 = ActivityValue.create({value: "Internal Note", sort_id:2, active: true })
activity_value3 = ActivityValue.create({value: "System Audit", sort_id:3, active: true })

task_cat1 = TaskCategory.create({value: "Main", sort_id:1, active:true })
task_cat2 = TaskCategory.create({value: "Proposal", sort_id:2, active:true })
task_cat3 = TaskCategory.create({value: "Foundation", sort_id:3, active:true })
task_cat4 = TaskCategory.create({value: "Framing", sort_id:4, active:true })

project1 = Project.create({
    job_number: 100,
    status_value_id: status1.id,
    address1: "10 Downing St.",
    address2: "",
    city: "London",
    project_description: "Repair crack in foundation of country",
    payment_method_value_id: payment1.id,
    client_id: client2.id,
    budget: 100000,
    contract_date: 2020-01-02,
    st_contract_received_date: 2020-01-10,
    framing_due_date: 2020-01-15,
    foundation_due_date: 2020-01-15,
    email_from_dwg_received_date: 2020-01-18,
    contract_proposal_sent_date: 2020-01-20,
    ready_to_be_invoiced: false
})

activity1 = Activity.create({
    activity_value_id: activity_value1.id,
    project_id: project1.id,
    activity_date: 2020-01-15,
    notes: "We talked about the weather",
    important: true,
    archived: false
})

activity2 = Activity.create({
    activity_value_id: activity_value2.id,
    project_id: project1.id,
    activity_date: 2020-01-18,
    notes: "We talked about football",
    important: false,
    archived: false
})

task1 = Task.create({name: "Print Task Sheet", task_category_id: task_cat1.id, sort_id: 10, active: true})
task2 = Task.create({name: "Create Folder", task_category_id: task_cat1.id, sort_id: 20, active: true})
task3 = Task.create({name: "Pin Folder to Quick Access", task_category_id: task_cat2.id, sort_id: 30, active: true})
task4 = Task.create({name: "Get Drafting Started", task_category_id: task_cat2.id, sort_id: 40, active: true})
task5 = Task.create({name: "Gravity Calcs", task_category_id: task_cat2.id, sort_id: 50, active: true})
task6 = Task.create({name: "Lateral Calcs", task_category_id: task_cat3.id, sort_id: 60, active: true})

project_task1 = ProjectTask.create({project_id: project1.id, task_id: task1.id, completed: true})
project_task2 = ProjectTask.create({project_id: project1.id, task_id: task2.id, completed: true})
project_task3 = ProjectTask.create({project_id: project1.id, task_id: task3.id, completed: false})
project_task4 = ProjectTask.create({project_id: project1.id, task_id: task4.id, completed: false})
project_task5 = ProjectTask.create({project_id: project1.id, task_id: task5.id, completed: true})
project_task6 = ProjectTask.create({project_id: project1.id, task_id: task6.id, completed: false})

