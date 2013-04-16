class ContactForm < ActionMailer::Base
  default from: "info@webcake.ch"
  layout 'mail'
  def form_input(customer,input)
    @customer = customer
    @input = input
    @subject = "Kontaktforumlar - Neue Nachricht"
    mail(:to => @customer.email, :subject => @subject)
  end
end
