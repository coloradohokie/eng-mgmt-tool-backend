# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#destroy_all joins first

Task.destroy_all
ProjectActivity.destroy_all
Project.destroy_all

Client.destroy_all
Status.destroy_all
PaymentMethod.destroy_all
Activity.destroy_all
TaskTemplateTask.destroy_all
TaskTemplate.destroy_all

client1 = Client.create({name:"John Roebling", phone:"212-231-3324", email:"jroebling@brooklyn.us"})
client2 = Client.create({name:"Louis Skidmore", phone: "312-554-9090", email: "Louis@som.com"})

status1 = Status.create({value:"Proposed", sort_id:1, active: true})
status2 = Status.create({value:"Open", sort_id:2, active: true})
status3 = Status.create({value:"On Hold", sort_id:3, active: true})
status4 = Status.create({value:"Completed", sort_id:4, active: true})

payment1 = PaymentMethod.create({value:"Cash on Delivery", sort_id:1, active: true})
payment2 = PaymentMethod.create({value:"Credit", sort_id:2, active: true})

activity_value1 = Activity.create({value: "Phone Call", sort_id:1, active: true })
activity_value2 = Activity.create({value: "Internal Note", sort_id:2, active: true })
activity_value3 = Activity.create({value: "System Audit", sort_id:3, active: true })

# task_cat1 = TaskCategory.create({value: "Main", sort_id:1, active: true })
task_cat1 = TaskTemplate.create({name: "Main", sort_id:1, active: true })
task_cat2 = TaskTemplate.create({name: "Proposal", sort_id:2, active: true })
task_cat3 = TaskTemplate.create({name: "Foundation", sort_id:3, active: true })
task_cat4 = TaskTemplate.create({name: "Framing", sort_id:4, active: true })

project1 = Project.create({
    job_number: 176223,
    status_id: status1.id,
    address1: "10 Downing St.",
    address2: "",
    city: "London",
    project_description: "Repair crack in foundation of country",
    payment_method_id: payment1.id,
    client_id: client2.id,
    budget: 100000,
    contract_date: "2020-01-02",
    st_contract_received_date: "2020-01-10",
    framing_due_date: "2020-01-15",
    foundation_due_date: "2020-01-15",
    email_from_dwg_received_date: "2020-01-18",
    contract_proposal_sent_date: "2020-01-20",
    ready_to_be_invoiced: false
})

project4 = Project.create({
    job_number: 176110,
    status_id: status2.id,
    address1: "2620 E. 2nd Ave",
    address2: "Unit 1",
    city: "Denver",
    project_description: "Repair roof so as not to leak",
    payment_method_id: payment2.id,
    client_id: client2.id,
    budget: 100000,
    contract_date: "2020-01-02",
    st_contract_received_date: "2020-01-10",
    framing_due_date: "2020-01-15",
    foundation_due_date: "2020-01-15",
    email_from_dwg_received_date: "2020-01-18",
    contract_proposal_sent_date: "2020-01-20",
    ready_to_be_invoiced: true
})

project2 = Project.create({
    job_number: 176701,
    status_id: status2.id,
    address1: "1600 Pennsylvania Ave.",
    address2: "",
    city: "Washington",
    project_description: "reinforce bullet proof glass",
    payment_method_id: payment1.id,
    client_id: client2.id,
    budget: 100000,
    contract_date: "2020-01-02",
    st_contract_received_date: "2020-01-10",
    framing_due_date: "2020-01-15",
    foundation_due_date: "2020-01-15",
    email_from_dwg_received_date: "2020-01-18",
    contract_proposal_sent_date: "2020-01-20",
    ready_to_be_invoiced: true
})

project3 = Project.create({
    job_number: 176507,
    status_id: status1.id,
    address1: "16501 Auraria Pkwy",
    address2: "",
    city: "Denver",
    project_description: "Install successful basketball team",
    payment_method_id: payment1.id,
    client_id: client2.id,
    budget: 100000,
    contract_date: "2020-01-02",
    st_contract_received_date: "2020-01-10",
    framing_due_date: "2020-01-15",
    foundation_due_date: "2020-01-15",
    email_from_dwg_received_date: "2020-01-18",
    contract_proposal_sent_date: "2020-01-20",
    ready_to_be_invoiced: false
})

activity1 = ProjectActivity.create({
    activity_id: activity_value1.id,
    project_id: project1.id,
    activity_date: "2020-01-15",
    notes: "We talked about the weather",
    important: true,
    archived: false
})

activity2 = ProjectActivity.create({
    activity_id: activity_value2.id,
    project_id: project1.id,
    activity_date: "2020-01-18",
    notes: "We talked about football",
    important: false,
    archived: false
})

task11 = TaskTemplateTask.create({name: "Print Task Sheet", task_template_id: task_cat1.id, sort_id: 10, active: true})
task12 = TaskTemplateTask.create({name: "Create Folder", task_template_id: task_cat1.id, sort_id: 20, active: true})
task13 = TaskTemplateTask.create({name: "Pin Folder to Quick Access", task_template_id: task_cat1.id, sort_id: 30, active: true})
task14 = TaskTemplateTask.create({name: "Get Drafting Started", task_template_id: task_cat1.id, sort_id: 40, active: true})

task20 = TaskTemplateTask.create({name: "Estimate", task_template_id: task_cat2.id, sort_id: 1, active: true})
task21 = TaskTemplateTask.create({name: "Discuss w/Dale", task_template_id: task_cat2.id, sort_id: 2, active: true})
task22 = TaskTemplateTask.create({name: "Proposal", task_template_id: task_cat2.id, sort_id: 3, active: true})
task23 = TaskTemplateTask.create({name: "Contract", task_template_id: task_cat2.id, sort_id: 4, active: true})
task24 = TaskTemplateTask.create({name: "Send Proposal & Contract", task_template_id: task_cat2.id, sort_id: 5, active: true})

task30 = TaskTemplateTask.create({name: "Gravity Calcs", task_template_id: task_cat3.id, sort_id: 1, active: true})
task31 = TaskTemplateTask.create({name: "Lateral Calcs", task_template_id: task_cat3.id, sort_id: 2, active: true})
task32 = TaskTemplateTask.create({name: "Drafting", task_template_id: task_cat3.id, sort_id: 3, active: true})
task33 = TaskTemplateTask.create({name: "Review", task_template_id: task_cat3.id, sort_id: 4, active: true})
task34 = TaskTemplateTask.create({name: "Stamp", task_template_id: task_cat3.id, sort_id: 5, active: true})
task35 = TaskTemplateTask.create({name: "Scan & Save", task_template_id: task_cat3.id, sort_id: 6, active: true})
task36 = TaskTemplateTask.create({name: "Invoice", task_template_id: task_cat3.id, sort_id: 7, active: true})
task37 = TaskTemplateTask.create({name: "Send to Client", task_template_id: task_cat3.id, sort_id: 8, active: true})

task41 = TaskTemplateTask.create({name: "Calcs", task_template_id: task_cat4.id, sort_id: 1, active: true})
task42 = TaskTemplateTask.create({name: "Drafting", task_template_id: task_cat4.id, sort_id: 2, active: true})
task43 = TaskTemplateTask.create({name: "Review", task_template_id: task_cat4.id, sort_id: 3, active: true})
task44 = TaskTemplateTask.create({name: "Stamp", task_template_id: task_cat4.id, sort_id: 4, active: true})
task45 = TaskTemplateTask.create({name: "Scan & Save", task_template_id: task_cat4.id, sort_id: 5, active: true})
task46 = TaskTemplateTask.create({name: "Invoice", task_template_id: task_cat4.id, sort_id: 6, active: true})
task47 = TaskTemplateTask.create({name: "Send to Client", task_template_id: task_cat4.id, sort_id: 7, active: true})

Task.create!({project_id: project1.id, name: "Print Task Sheet", sort_id: 11, active: true, template_name: "Main", done: false})
Task.create!({project_id: project1.id, name: "Create Folder", sort_id: 12, active: true, template_name: "Main", done: false})
Task.create!({project_id: project1.id, name: "Pin Folder to Quick Access", sort_id: 13, active: true, template_name: "Main", done: false})
Task.create({project_id: project1.id, name: "Get Drafting Started", sort_id: 14, active: true, template_name: "Main", done: false})
Task.create({project_id: project1.id, name: "Gravity Calcs", sort_id: 30, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Lateral Calcs", sort_id: 31, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Drafting", sort_id: 32, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Review", sort_id: 33, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Stamp", sort_id: 34, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Scan & Save", sort_id: 35, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Invoice", sort_id: 36, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Send to Client", sort_id: 37, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project1.id, name: "Calcs", sort_id: 41, active: true, template_name: "Framing", done: false})
Task.create({project_id: project1.id, name: "Drafting", sort_id: 42, active: true, template_name: "Framing", done: false})
Task.create({project_id: project1.id, name: "Review", sort_id: 43, active: true, template_name: "Framing", done: false})
Task.create({project_id: project1.id, name: "Stamp", sort_id: 44, active: true, template_name: "Framing", done: false})
Task.create({project_id: project1.id, name: "Scan & Save", sort_id: 45, active: true, template_name: "Framing", done: false})
Task.create({project_id: project1.id, name: "Invoice", sort_id: 46, active: true, template_name: "Framing", done: false})
Task.create({project_id: project1.id, name: "Send to Client", sort_id: 47, active: true, template_name: "Framing", done: false})

Task.create({project_id: project2.id, name: "Print Task Sheet", sort_id: 11, active: true, template_name: "Main", done: false})
Task.create({project_id: project2.id, name: "Create Folder", sort_id: 12, active: true, template_name: "Main", done: false})
Task.create({project_id: project2.id, name: "Pin Folder to Quick Access", sort_id: 13, active: true, template_name: "Main", done: false})
Task.create({project_id: project2.id, name: "Get Drafting Started", sort_id: 14, active: true, template_name: "Main", done: false})
Task.create({project_id: project2.id, name: "Gravity Calcs", sort_id: 30, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Lateral Calcs", sort_id: 31, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Drafting", sort_id: 32, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Review", sort_id: 33, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Stamp", sort_id: 34, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Scan & Save", sort_id: 35, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Invoice", sort_id: 36, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Send to Client", sort_id: 37, active: true, template_name: "Foundation", done: false})
Task.create({project_id: project2.id, name: "Calcs", sort_id: 41, active: true, template_name: "Framing", done: false})
Task.create({project_id: project2.id, name: "Drafting", sort_id: 42, active: true, template_name: "Framing", done: false})
Task.create({project_id: project2.id, name: "Review", sort_id: 43, active: true, template_name: "Framing", done: false})
Task.create({project_id: project2.id, name: "Stamp", sort_id: 44, active: true, template_name: "Framing", done: false})
Task.create({project_id: project2.id, name: "Scan & Save", sort_id: 45, active: true, template_name: "Framing", done: false})
Task.create({project_id: project2.id, name: "Invoice", sort_id: 46, active: true, template_name: "Framing", done: false})
Task.create({project_id: project2.id, name: "Send to Client", sort_id: 47, active: true, template_name: "Framing", done: false})

Task.create({project_id: project3.id, name: "Estimate", sort_id: 20, active: true, template_name: "Proposal", done: false})
Task.create({project_id: project3.id, name: "Discuss w/ Dale", sort_id: 21, active: true, template_name: "Proposal", done: false})
Task.create({project_id: project3.id, name: "Proposal", sort_id: 22, active: true, template_name: "Proposal", done: false})
Task.create({project_id: project3.id, name: "Contract", sort_id: 23, active: true, template_name: "Proposal", done: false})
Task.create({project_id: project3.id, name: "Send Proposal & Contract", sort_id: 24, active: true, template_name: "Proposal", done: false})


# ProjectTask.create({project_id: project1.id, task_id: task11.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task12.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task13.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task14.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task30.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task31.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task32.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task33.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task34.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task35.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task36.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task37.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task41.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task42.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task43.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task44.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task45.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task46.id, completed: false})
# ProjectTask.create({project_id: project1.id, task_id: task47.id, completed: false})

# ProjectTask.create({project_id: project2.id, task_id: task11.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task12.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task13.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task14.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task30.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task31.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task32.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task33.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task34.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task35.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task36.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task37.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task41.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task42.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task43.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task44.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task45.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task46.id, completed: false})
# ProjectTask.create({project_id: project2.id, task_id: task47.id, completed: false})

# ProjectTask.create({project_id: project3.id, task_id: task20.id, completed: false})
# ProjectTask.create({project_id: project3.id, task_id: task21.id, completed: false})
# ProjectTask.create({project_id: project3.id, task_id: task22.id, completed: false})
# ProjectTask.create({project_id: project3.id, task_id: task23.id, completed: false})
# ProjectTask.create({project_id: project3.id, task_id: task24.id, completed: false})

