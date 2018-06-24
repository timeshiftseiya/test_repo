class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  #protect_from_forgery except: [:create, :destroy]
  
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.js @user
    end
    
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    rendor @user
  end
end
