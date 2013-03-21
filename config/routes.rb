WebcakeService::Application.routes.draw do
  match "/contact_form/register" => "ContactForms#register"
  match "/contact_form/send" => "ContactForms#send_mail"
end
