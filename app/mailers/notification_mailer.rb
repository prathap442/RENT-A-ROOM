class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.authorization_message_sending.subject
  #
  def authorization_message_sending(room_owner)
    @greeting = room_owner

    mail to: "pmohansaikrishna@gmail.com",subject: "Your room is now being authorized by the administrator"
  
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notification_two.subject
  #
  def notification_two(booking)
    binding.pry
    @greeting = booking
    binding.pry
    mail to: "pmohansaikrishna@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notification_three.subject
  #
  def notification_three(booking)
    @greeting = booking

    mail to: "pmohansaikrishna@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notification_four.subject
  #
  def notification_four(booking)
    @greeting = booking

    mail to: "pmohansaikrishna@gmail.com"
  end
end
