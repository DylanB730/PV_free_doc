# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


specialties = ["Osthéo", "Dentiste", "Généraliste", "Chirurgien", "Kiné"]

#Création de X docteurs
5.times do
 doctors = Doctor.create(
  first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name, 
  specialty: specialties.sample.to_s, 
  zip_code: Faker::Address.zip_code
  )
end

#Création de X patients
10.times do
  patients = Patient.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name
  )
end

#Création de X RDVs pour lier des docteurs avec des patients
10.times do
  RDV = Appointment.create(
    doctor: Doctor.find(rand(1..Doctor.all.length)), 
    patient: Patient.find(rand(1..Patient.all.length)),
    date: Faker::Time.between(from: DateTime.now - 87, to: DateTime.now + 60, format: :short)
  )
end

