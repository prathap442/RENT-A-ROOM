require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "authorization_message_sending" do
    mail = NotificationMailer.authorization_message_sending
    assert_equal "Authorization message sending", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notification_two" do
    mail = NotificationMailer.notification_two
    assert_equal "Notification two", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notification_three" do
    mail = NotificationMailer.notification_three
    assert_equal "Notification three", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notification_four" do
    mail = NotificationMailer.notification_four
    assert_equal "Notification four", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
