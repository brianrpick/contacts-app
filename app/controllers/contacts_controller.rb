class ContactsController < ApplicationController
  before_action :authenticate_user!
  def home
    
  end
  def new
  end
  def create
    @contact = Contact.new(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], phone: params[:phone], email: params[:email], bio: params[:bio], user_id: current_user)
    @contact.save
    redirect_to '/index'
  end
  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def index
    @contact = Contact.all.where(user_id: current_user)  
  end
  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.assign_attributes(first_name: params[:first_name], middle_name: params[:middle_name], last_name: params[:last_name], phone: params[:phone], email: params[:email], bio: params[:bio])
    @contact.save
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy 
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    redirect_to "/contacts"
  end
end