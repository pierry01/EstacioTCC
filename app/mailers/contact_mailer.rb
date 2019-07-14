class ContactMailer < ApplicationMailer
  def contact_us(current_user, message)
    @user_message = message
    @current_user = current_user
    
    mail(
      from: current_user.email,
      to: Admin.first.email,
      subject: "Mensagem de #{ current_user.email }"
    )
  end
end
