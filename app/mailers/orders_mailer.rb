class OrdersMailer < ApplicationMailer
  default from: 'philippe.teigne@gmail.com'
  layout 'mailer'

  def order_email
    if params[:user]
      @user = params[:user]
    else
      @user = User.find(1)
    end
    @order = params[:order]
    @enhanced_cart = params[:enhanced_cart]
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Your Jungle Book Order Summary')
  end
end
