# Aquí se crean las universidades para poder inscribir a los estudiantes
puts "Cleaning University db..."
University.destroy_all

puts "Creating Universities one by one..."
universities = []
uc = { name: "Universidad Católica", initials: "UC" }
universities.append(uc)
uch = { name: "Universidad de Chile", initials: "UCH" }
universities.append(uch)
uai = { name: "Universidad Adolfo Ibáñez", initials: "UAI" }
universities.append(uai)
udec = { name: "Universidad de Concepción", initials: "UdeC" }
universities.append(udec)
utfsm = { name: "Universidad Técnica Federico Santa María", initials: "UTFSM" }
universities.append(utfsm)
uandes = { name: "Universidad de los Andes", initials: "UANDES" }
universities.append(uandes)
udd = { name: "Universidad del Desarrollo", initials: "UDD" }
universities.append(udd)
udp = { name: "Universidad Diego Portales", initials: "UDP" }
universities.append(udp)
uft = { name: "Universidad Finis Terrae", initials: "UFT" }
universities.append(uft)
usach = { name: "Universidad de Santiago", initials: "USACH" }
universities.append(usach)
unab = { name: "Universidad Andrés Bello", initials: "UNAB" }
universities.append(unab)

universities.each do |u|
  university = University.create!(u)
  puts "#{university.name} created"
end
puts "Done with the universities!"

# Aquí se crean las carreras para poder inscribir a los estudiantes
puts "Cleaning Career db..."
Career.destroy_all

puts "Creating Universities one by one..."
careers = []
ing = { name: "Ingeniería, tecnología y administración" }
careers.append(ing)
salud = { name: "Ciencias de la salud" }
careers.append(salud)
ed = { name: "Educación" }
careers.append(ed)
der = { name: "Derecho" }
careers.append(der)
soc = { name: "Ciencias sociales" }
careers.append(soc)
art = { name: "Arte y arquitectura" }
careers.append(art)
bas = { name: "Ciencias básicas" }
careers.append(bas)
hum = { name: "Humanidades" }
careers.append(hum)

careers.each do |c|
  career = Career.create!(c)
  puts "#{career.name} created"
end
puts "Done with the careers!"

puts "Remember to create an admin from the console to manage everything from the matrix!..."

puts "Done! The app is up and running!"
