class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_photo.subject
  #
  def sendmail_photo(photo)
   @photo = photo

    mail to: @contact.email,
     subject: '【UJISTAGRAM】Photo has posted'
  end
end
