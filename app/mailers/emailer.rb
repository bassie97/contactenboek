class Emailer < ApplicationMailer
  def first_mail(contact)
    @contact = user
    @url = 'www.google.nl'
    mail(to: @contact, subject: 'Je hebt zojuist een mail ontvangen.ge')
  end
end
