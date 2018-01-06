# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/authorization_message_sending
  def authorization_message_sending
    NotificationMailer.authorization_message_sending
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/notification_two
  def notification_two
    NotificationMailer.notification_two
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/notification_three
  def notification_three
    NotificationMailer.notification_three
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/notification_four
  def notification_four
    NotificationMailer.notification_four
  end

end
