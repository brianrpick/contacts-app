class ContactsController < ApplicationController
  def home
    @contact = Contact.all
  end
  def new
  end
  def create
    @contact = Contact.new(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], email: params[:email])
    @contact.save
  end
  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def index
    @contact = Contact.all
  end
  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.assign_attributes(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], email: params[:email])
    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    redirect_to "/contacts/"
  end
end