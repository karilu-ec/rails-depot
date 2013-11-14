require 'test_helper'

class CartNotifierTest < ActionMailer::TestCase
  test "errorReceived" do
    mail = CartNotifier.errorReceived(carts(:one))
    assert_equal "Pragmatic Store Error Bad Cart Id was sent", mail.subject
    assert_equal ["karina.simpson@gmail.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    
  end

end
