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

    #mail :to => "info@mtc-serviciosintegrales.es", :subject => "[Web] Nou missatge de #{email}", :bcc => "it@itnig.net"
    mail :to => "roger@itnig.net", :subject => "[Web] Nou missatge de #{email}", :bcc => "it@itnig.net"
  end
end
