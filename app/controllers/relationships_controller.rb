class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: [:create, :destroy]
  # respond_to :js

  def create
    respond_to do |format|
      format.js do
        @user = User.find(params[:relationship][:followed_id])
        current_user.follow!(@user)
      end
    end
    # respond_with @user
  end
  
  def destroy
    respond_to do |format|
      format.js do
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow!(@user)
      end  
    end
    # respond_with @user
  end
end
