class CartNotifier < ActionMailer::Base
  default from: "Kari Simpson <depot@example.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cart_notifier.errorReceived.subject
  #
  def errorReceived(cart_id)
    @cart = cart_id
    admin="karina.simpson@gmail.com"

    mail to: admin, subject: 'Pragmatic Store Error Bad Cart Id was sent'
  end
end
