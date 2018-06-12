class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @wine = @comment.wine
    respond_to do |format|
      if @comment.save
        format.html { redirect_to wine_path(@wine), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @comment=Comment.find(params[:id])
    @wine = @comment.wine
  end

  def update
     @comment=Comment.find(params[:id])
     if @comment.update(comment_params)
       redirect_to wine_path(@comment.wine), notice: "コメントを更新しました"
     else
       render 'edit'
     end
  end

   def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to wine_path(@wine), notice: 'コメントを削除しました。' }
      format.js { render :index }
    end
  end

 
  private
    def comment_params
      params.require(:comment).permit(:wine_id, :content)
    end
end
