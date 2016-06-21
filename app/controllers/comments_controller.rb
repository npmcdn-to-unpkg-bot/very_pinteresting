class CommentsController < ApplicationController
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(comment_params)
    redirect_to pin_path(@pin)
  end

  private
   def comment_params
     params.require(:comment).permit(:user_id, :body)
   end
end
