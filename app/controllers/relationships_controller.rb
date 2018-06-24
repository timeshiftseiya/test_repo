class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: [:create, :destroy]
  # respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    @user
    respond_to do |format|
      format.js
    end  
    # respond_with @user
  end
  
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    @user
    respond_to do |format|
      format.js
    end  
    # respond_with @user
  end
end
