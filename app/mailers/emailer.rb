class Emailer < ApplicationMailer
  def first_mail(mail)
    mail(to: mail[:email],
         body: mail[:message],
         content_type: "text/html",
         subject: mail[:subject])
  end
end
