class ApplicationMailer < ActionMailer::Base
  default from: "PaperboyDigital <no-reply@showhn.paperboy.digital>"
  default reply_to: "PaperboyDigital <hey@paperboy.digital>"
  layout 'mailer'
end

