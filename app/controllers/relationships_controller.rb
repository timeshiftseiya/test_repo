class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    
    respond_to do |format|
      format.js {render '/relationships/create'}
    end
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.js {render '/relationships/destroy'}
    end 
  end
end
