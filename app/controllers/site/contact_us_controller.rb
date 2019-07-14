class Site::ContactUsController < SiteController
  def new
  end
  
  def create
    @message = params[:contact_us][:user_message]
    ContactMailer.contact_us(current_user, @message).deliver_now!
  end
end
