# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin_user = User.create(name: "Admin User", email: "admin@microverse.com", password: "password", role: "admin")
view_user1 = User.create!(name: "Antoine", email: "antoine@microverse.com", password: "password")
view_user2 = User.create!(name: "Mohamed", email: "mighe@microverse.com", password: "password")

admin_user.image.attach(io: File.open("#{Rails.root}/public/users/194934.png"), filename: '194934.png', content_type: 'image/png')
view_user1.image.attach(io: File.open("#{Rails.root}/public/users/194935.png"), filename: '194935.png', content_type: 'image/png')
view_user2.image.attach(io: File.open("#{Rails.root}/public/users/194938.png"), filename: '194938.png', content_type: 'image/png')

doctor1 = Doctor.create!(name: "Dr. John Adams", hospital: 'New York', specialization: 'Cardiology', cost_per_consult: 100, description: 'Dr. John Adams is a cardiologist who specializes in heart disease. He is a certified heart surgeon and a member of the American Heart Association.')
doctor2 = Doctor.create!(name: "Dr. Robert Spear", hospital: 'New Jearsy', specialization: 'Nevrology', cost_per_consult: 70, description: 'Dr. Dr. Robert Spear is a nevrologiest who specializes in heart disease. He is a certified heart surgeon and a member of the American Heart Association.')
doctor3 = Doctor.create!(name: "Dr. Bob Jones", hospital: 'Struga', specialization: 'Cardiology', cost_per_consult: 150, description: 'Dr. Bob Jones is a cardiologist who specializes in heart disease. He is a certified heart surgeon and a member of the American Heart Association.')

doctor1.image.attach(io: File.open("#{Rails.root}/public/doctors/doctor1.jpg"), filename: 'doctor1.jpg', content_type: 'image/jpg')
doctor2.image.attach(io: File.open("#{Rails.root}/public/doctors/doctor2.jpg"), filename: 'doctor2.jpg', content_type: 'image/jpg')
doctor3.image.attach(io: File.open("#{Rails.root}/public/doctors/doctor3.jpg"), filename: 'doctor3.jpg', content_type: 'image/jpg')

appointment1 = Reservation.create!(doctor_id: doctor1.id, user_id: view_user1.id, date_of_appointment: Time.now)
appointment2 = Reservation.create!(doctor_id: doctor2.id, user_id: view_user1.id, date_of_appointment: Time.now)
appointment3 = Reservation.create!(doctor_id: doctor3.id, user_id: view_user1.id, date_of_appointment: Time.now)