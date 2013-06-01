# encoding: utf-8
class CommentMailer < ActionMailer::Base
  default from: "RollBook<#{ENV['MAIL_ADDR']}>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.sendmail.subject
  #
  def sendmail(user)
    @user = user

    mail(:to => user.email, :subject => "[RollBook]コメントがありました")

  end
end
