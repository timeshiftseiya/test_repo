class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  #protect_from_forgery except: [:create, :destroy]
  
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    # respond_to do |format|
    #   format.js {render :create}
    # endi
    redirect_to root_path
    
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    # respond_to do |format|
    #   format.js {render :destroy}
    # end 
    redirect_to root_path
  end
end
