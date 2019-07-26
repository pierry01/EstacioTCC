class Site::ContactUsController < SiteController
  before_action :authenticate_user!
  
  def create
    @message = params[:contact_us][:user_message]
    ContactMailer.contact_us(current_user, @message).deliver_now!
    
    redirect_to root_path, notice: 'E-mail enviado para os administradores.'
  end
end
