class UserMailer < ApplicationMailer
    # modelのような役割?　ApplicationMailerの定義を継承したUserMailerで、おそらくmail_titleとかはdbのカラムのような役割をするのでは？
    default from: 'notifications@example.com'
    
    def send_mail(mail_title, mail_content, group_users)
        @mail_title = mail_title
        @mail_content = mail_content
        mail bcc: group_users.pluck(:email), subject: mail_title
    end 
end
