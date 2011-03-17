class StaticController < ApplicationController

  def question
    render :layout => false
  end

  def new_question
    name = params[:name]
    company = params[:company]
    phone = params[:phone]
    email = params[:email]
    msg = params[:msg]
    city = params[:city]
    address = params[:address]
    zipcode = params[:zipcode]
    fax = params[:fax]

    if name.blank? || email.blank? || phone.blank?
      flash[:notice] = "Tienes que introducir los datos obligatorios"
      redirect_to root_url
      return
    end

    Contact.new_contact(name, company, phone, email, msg, city, address, zipcode, fax).deliver
    redirect_to root_url
  end
end
