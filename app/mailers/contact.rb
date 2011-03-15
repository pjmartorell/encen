class Contact < ActionMailer::Base
  default :from => "info@mtc-serviciosintegrales.es"

  def new_contact(name, company, phone, email, msg, city, address, zipcode, fax)
    @name = name
    @company = company
    @phone = phone
    @email = email
    @msg = msg
    @city = city
    @address = address
    @zipcode = zipcode
    @fax = fax

    mail :to => ["it@itnig.net", "info@mtcserviciosintegrales.com"], :subject => "[Web] Nou missatge de #{email}"
  end
end
