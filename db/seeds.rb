# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# #How to create a physician
# Physician.create(name: "Jeffery R. Johnson", title:"Dr.", specialty:"Orthiopedics")

# #How to create a patient
# Patient.create(first_name:"Landon", last_name:"Whitesides", age:30, phone:"(208)312-550",email:"whitesideslandon@gmail.com")

# #How to create an appointment from physician

# physician = Physician.find(1)

# appointment = physician.appointments.create(appointment_date: '2020-11-30 09:00:00',patient_id:1)

# #How to create an appointment from patient

# patient = Patient.find(1)

# appointment = patient.appointments.create(appointment_date: '2020-11-30 10:00:00',physician_id:1)

######################## Real Seed Data ############################

#create like 5 physicians

require 'faker'

physicians = []
patients = []
titles = ["RN","M.D.","PA","NP"]
specialties = ["Cardiothoracic Radiology","Dermatology","General Surgery"]

5.times do 
   physicians << Physician.create(name: Faker::FunnyName.name, title:titles.sample, specialty:specialties.sample)
end

30.times do 
    patients << Patient.create(first_name:Faker::Name.first_name, last_name: Faker::Name.last_name, age:rand(1..90), phone:"(#{rand(100-999)})#{rand(100-999)}-#{rand(1000-9990)}",email:Faker::Internet.email)
end

physicians.each do |physician|
    10.times do
    physician.appointments.create(appointment_date: Faker::Date.between(from: '2020-11-30', to: '2021-03-30'), patient_id:patients.sample.id)
    end

end

    



#create like 30 patients


#create appointments so that each patient has an appointment with at least one physician
