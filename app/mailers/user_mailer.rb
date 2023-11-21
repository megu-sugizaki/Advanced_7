class UserMailer < ApplicationMailer
    # modelのような役割?　ApplicationMailerの定義を継承したUserMailerで、おそらくmail_titleとかはdbのカラムのような役割をするのでは？
    # おそらく、user_mailerのviewの中に入っているsend_notification.text.erb用のcontroller

  def send_notification(member, event)
      @group = event[:group]
      @title = event[:title]
      @body = event[:body]
      
      @mail = UserMailer.new()
      mail(
          from :ENV['MAIL_ADDRESS'],
          to: member.email,
          subject: 'New Event Notice!!'
          )
  end 
  
  def self.send_notifications_to_group(event)
      group = event[:group]
      group.users.each do |member|
           UserMailer.send_notification(member, event).deliver.now
      end 
  end 

end
