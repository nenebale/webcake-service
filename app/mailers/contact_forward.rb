class ContactForward < ActionMailer::Base
  default from: "info@webcake.ch"
  def send_mail(customer,input)
    @customer = customer
    @input = input
    mail(:to => @customer.email, :subject => "Kontaktforumlar - Neue Nachricht")
  end
end
