class EventNoticesController < ApplicationController
    # おそらく、event_notices内に入っているview用のcontroller
    
    def new 
        @group = Group.find(params[:group_id])
    end 
    
    def create
        @group = Group.find(params[:group_id])
        @title = params[:title]
        @body = params[:body]
        
        event = {
            :group => @group,
            :title => @title,
            :body => @body
        }
        
        UserMailer.send_notifications_to_group(event)
        
        render :sent
    end 
    
    def sent
        redirect_to group_path(params[:group_id])
    end 
    
end
