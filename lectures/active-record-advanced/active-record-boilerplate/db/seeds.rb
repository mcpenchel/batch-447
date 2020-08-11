# This is where you can create initial data for your app.

Consultation.destroy_all
Patient.destroy_all
Intern.destroy_all
Doctor.destroy_all

alia = Doctor.new(first_name: "Ália", last_name: "Penchel", specialty: "Kids")
alia.save!

tex = Doctor.new(first_name: "Thiago", last_name: "Teixeira", specialty: "Neurologist")
tex.save!

patrick = Patient.new(name: "Patrick", disease: "Flu", age: 29, gender: "male")
patrick.save!

marco = Patient.new(name: "Marco", disease: "Fever", age: 26, gender: "male")
marco.save

caio = Intern.new(first_name: "Caio", last_name: "Farias", doctor: tex)
caio.save!

renata = Intern.new(first_name: "Renata", last_name: "Grassi", doctor: tex)
renata.save!

mathias = Intern.new(first_name: "Mathias", last_name: "Ribeiro", doctor: alia)
mathias.save!

Consultation.create!(patient: patrick, doctor: tex, scheduled_time: "Tuesday 10h30")
Consultation.create!(patient: marco, doctor: tex, scheduled_time: "Tuesday 10h30")
Consultation.create!(patient: marco, doctor: alia, scheduled_time: "Tuesday 10h30")
