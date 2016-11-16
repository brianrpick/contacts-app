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

    @contact.save
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
  end
end