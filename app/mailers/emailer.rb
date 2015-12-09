class Emailer < ApplicationMailer
  def first_mail(contact)
    @contact = contact
    @url = 'www.google.nl'
    mail(to: @contact, subject: 'Je hebt zojuist een mail ontvangen.ge')
  end
end
