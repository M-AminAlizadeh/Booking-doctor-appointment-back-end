admin_user = User.create(name: "Admin User", email: "admin@microverse.com", password: "password", role: "admin")
view_user1 = User.create!(name: "Antoine", email: "antoine@microverse.com", password: "password")
view_user2 = User.create!(name: "Jamal", email: "jamal@gmail.com", password: "jamal@gmail.com")

doctors_data = [
  {
    name: "Dr. John Adams",
    hospital: 'New York General Hospital',
    specialization: 'Cardiology',
    cost_per_consult: 100,
    description: 'Cardiologist with extensive experience in treating heart diseases.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctornotepad-1421526857009zrma0.png&f=1&nofb=1&ipt=9c8754b40e5819379d9d18380fbf946d49e3a05c0b22aba1c54afb651c7accfe&ipo=images'
  },
  {
    name: "Dr. Robert Spear",
    hospital: 'New Jersey Neurological Center',
    specialization: 'Neurology',
    cost_per_consult: 70,
    description: 'Neurologist specializing in neurological disorders and treatments.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctornotepad-1421526857009zrma0.png&f=1&nofb=1&ipt=9c8754b40e5819379d9d18380fbf946d49e3a05c0b22aba1c54afb651c7accfe&ipo=images'
  },
  {
    name: "Dr. Emily Carter",
    hospital: 'City Medical Center',
    specialization: 'Pediatrics',
    cost_per_consult: 90,
    description: 'Pediatrician dedicated to providing quality healthcare for children.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.publicdomainpictures.net%2Fpictures%2F210000%2Fvelka%2Fdoctor-1490804643Rfi.jpg&f=1&nofb=1&ipt=aa6baff97a64f0809d63dd9347a442186e1b7259633bf29a3b71af39bbb64d1b&ipo=images'
  },
  {
    name: "Dr. Maria Rodriguez",
    hospital: 'Sunset General Hospital',
    specialization: 'Internal Medicine',
    cost_per_consult: 120,
    description: 'Internist focusing on comprehensive adult healthcare services.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-doctordoctorsdoctors-and-nursesclinicianmedical-practitionernotepadfemale-14215268571744ntgi.png&f=1&nofb=1&ipt=47529d75b2dbb691b4e98bb4dcef704d3e3fb19ca5673b03c49038f17643c7e1&ipo=images'
  },
  {
    name: "Dr. Michael Chang",
    hospital: 'Metropolitan Surgical Center',
    specialization: 'Orthopedics',
    cost_per_consult: 110,
    description: 'Orthopedic surgeon specializing in musculoskeletal disorders and surgeries.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.writergirl.com%2Fwp-content%2Fuploads%2F2014%2F11%2FDoctor-790X1024.jpg&f=1&nofb=1&ipt=2342f1549c382fda1aee1371d273d939b936d16fe5e35478b7706a71cbb0cfc6&ipo=images'
  },
  {
    name: "Dr. Susan White",
    hospital: 'Women\'s Health Clinic',
    specialization: 'Obstetrics and Gynecology',
    cost_per_consult: 130,
    description: 'Obstetrician and gynecologist providing compassionate care for women.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-doctordoctorsdoctors-and-nursesclinicianmedical-practitionernotepadfemale-1421526857248uragw.png&f=1&nofb=1&ipt=ae07abc7271f14ab72268d495efd942853fa3dc82946beadd85c0fcbcfaed8a8&ipo=images'
  },
  {
    name: "Dr. Richard Turner",
    hospital: 'Dental Care Center',
    specialization: 'Dentistry',
    cost_per_consult: 80,
    description: 'Experienced dentist dedicated to oral health and hygiene.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.franklinhealthclinic.ca%2Fwp-content%2Fuploads%2F2020%2F03%2Fdoctor-img2.png&f=1&nofb=1&ipt=bfbd2ee9c4cd3a6d778f57bbf5e7258cbc8b36b1a1357fb8dc404b5dba9b97e9&ipo=images'
  },
  {
    name: "Dr. Patricia Miller",
    hospital: 'Eyesight Clinic',
    specialization: 'Ophthalmology',
    cost_per_consult: 95,
    description: 'Ophthalmologist specializing in eye care and vision correction.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.insurancejournal.com%2Fapp%2Fuploads%2F2014%2F01%2FDoctor.jpg&f=1&nofb=1&ipt=fb26c5be49f865db0fd6dbf2020cbf81c2068a7e999dfc17c9cf124ef77ff092&ipo=images'
  },
  {
    name: "Dr. William Baker",
    hospital: 'Respiratory Care Institute',
    specialization: 'Pulmonology',
    cost_per_consult: 110,
    description: 'Pulmonologist focusing on respiratory health and lung disorders.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpngimg.com%2Fuploads%2Fdoctor%2Fdoctor_PNG15959.png&f=1&nofb=1&ipt=1af3453f326beac9297740bd70a4f32e1664c5e705182a01a5a59f865e4a7e49&ipo=images'
  },
  {
    name: "Dr. Laura Anderson",
    hospital: 'Mental Wellness Center',
    specialization: 'Psychiatry',
    cost_per_consult: 150,
    description: 'Psychiatrist providing mental health support and therapy.',
    image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-doctordoctorsdoctors-and-nursesclinicianmedical-practitionernotepadfemale-142152685722142y8x.png&f=1&nofb=1&ipt=d4b718a0bb8854dc5618a5273caf37c4b4029585f667e81311b2b89e8d27a4fb&ipo=images'
  },
]

doctors_data.each do |doctor_info|
  Doctor.create!(doctor_info)
end

# Create sample appointments
doctors = Doctor.all
doctors.each do |doctor|
  Reservation.create!(doctor_id: doctor.id, user_id: view_user1.id, date_of_appointment: Time.now)
end
