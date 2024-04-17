class OrdersMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  layout 'mailer'

  def order_email
    @user = params[:user]
    @order = params[:order]
    @enhanced_cart = params[:enhanced_cart]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your Jungle Book Order Summary')
  end
end
