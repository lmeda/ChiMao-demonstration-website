class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy]
  before_action :authenticate_administrator!, except: [:new, :create]
  before_action :is_admin!, except: [:new, :create]

  # GET /contacts
  # GET /contacts.json
  def index
    @contact = Contact.all.order("created_at DESC")
    add_breadcrumb("Feedback")
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    add_breadcrumb("Contact us")
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    add_breadcrumb("Contact us")

    if @contact.save_with_captcha && verify_recaptcha(model: @contact) && @contact.save
      redirect_back(fallback_location: contact_chimao_path, flash: { :success => "留言成功，感謝您"})
    else
      flash[:warning] = "訊息填寫有誤。請重試"
      render 'new'
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    redirect_to feedback_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:title, :description, :name, :company, :address, :zip, :phone, :fax, :email, :captcha, :captcha_key)
    end
end
