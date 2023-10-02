class GroupsController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only: [:edit, :update]
    
    def new
      @group = Group.new
    end 
    
    def create
    @group = Group.new(book_params)
    @group.owner.id = current_user.id
      if @group.save
        redirect_to groups_path
      else
        render 'new'
      end
    end 
    
    def index
      @book.new
      @groups = Group.all
    end 
    
    def show
      @group = Group.find(params[:id])
      @book = Book.new
    end 
    
    def edit
    end 
    
    def update
      if @group.update(group_params)
        redirect_to groups_path
      else
        render "edit"
      end
    end 
    
   private
   
  def group_params
    params.require(:group).permit(:title, :body, :image)
  end
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.user == current_user
      redirect_to groups_path
    end
  end 
end
