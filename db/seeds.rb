User.destroy_all
# create users
# create Jascha
  jascha = User.new
  jascha.email = "jaschadrel@gmail.com"
  jascha.password = "123456"
  jascha.first_name = "Jascha"
  jascha.last_name = "Drel"
  jascha.date_of_birth = "1988-05-10"
  jascha.is_host = true
  jascha.save
# create Lamina
  lamina = User.new
  lamina.email = "lamina-vedder@msn.com"
  lamina.password = "123456"
  lamina.first_name = "Lamina"
  lamina.last_name = "Vedder"
  lamina.date_of_birth = "1994-11-29"
  lamina.is_host = true
  lamina.save
# create Daniel
  daniel = User.new
  daniel.email = "daniel@test.com"
  daniel.password = "123456"
  daniel.first_name = "Daniel"
  daniel.last_name = "Mera de Agustin"
  daniel.date_of_birth = "1980-01-22"
  daniel.is_host = true
  daniel.save
# create Vianney
  vianney = User.new
  vianney.email = "v2boisredon@hotmail.fr"
  vianney.password = "123456"
  vianney.first_name = "Vianney"
  vianney.last_name = "de Boisredon"
  vianney.date_of_birth = "1992-05-04"
  vianney.is_host = true
  vianney.save

#create Amsterdam
  amsterdam = Flat.new
  amsterdam.name = "Cool flat in Amsterdam"
  amsterdam.address = "Damrak, Amsterdam, Noord-Holland, The Netherlands"
  amsterdam.description = "Amsterdam, lovely Amsterdam so many beautiful houses. It's fucking increidible... but really. You should love this apt."
  amsterdam.price_per_night = 125
  amsterdam.number_of_guests = 4
  amsterdam.user = jascha
  amsterdam.latitude = 52.3751
  amsterdam.longitude = 4.89581
  amsterdam.save
  amsterdam_picture_1 = Picture.new
  amsterdam_picture_1.url = "https://www.fluentin3months.com/wp-content/uploads/2011/05/amsterdam.jpg"
  amsterdam_picture_1.is_primary = true
  amsterdam_picture_1.flat = amsterdam
  amsterdam_picture_1.save
#create Alicante
  alicante = Flat.new
  alicante.name = "Cool flat in alicante"
  alicante.address = "Alicante, Comunitat Valenciana, Spain"
  alicante.description = "Alicante, lovely Alicante so many beautiful houses. It's fucking increidible... but really. You should love this apt."
  alicante.price_per_night = 125
  alicante.number_of_guests = 4
  alicante.user = daniel
  alicante.latitude = 38.3537
  alicante.longitude = -0.490185
  alicante.save

