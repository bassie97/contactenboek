class Emailer < ApplicationMailer
  def first_mail(mail)
    mail(to: mail[:email],
         from: mail[:from],
         body: mail[:message],
         content_type: "text/html",
         subject: mail[:subject])
  end
end
