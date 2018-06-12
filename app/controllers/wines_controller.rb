class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:new,:edit,:show]
  
  def index
    @wines = Wine.all
  end
  
  def new
    if params[:back]
      @wine = Wine.new(wine_params)
    else
      @wine = Wine.new
    end
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.user_id = current_user.id
    @wine.image.retrieve_from_cache!(params[:cache][:image])
    @wine.save!
    if @wine.save
      redirect_to wines_path, notice: "画像を投稿しました！"
    else
      render 'new'
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(wine_id: @wine.id)
    @comment = @wine.comments.build
    @comments = @wine.comments
  end
  
  def edit
  end
  
  def update
    if @wine.update(wine_params)
      redirect_to wines_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @wine.destroy
    redirect_to wines_path, notice:"投稿を削除しました！"
  end
  
  def confirm
    @wine = Wine.new(wine_params)
    @wine.user_id = current_user.id
    render :new if @wine.invalid?
  end

  private
  def wine_params
    params.require(:wine).permit(:name,:content,:area,:color,:image,:image_cache)
  end
  
  def set_wine
    @wine = Wine.find(params[:id])
  end
end
