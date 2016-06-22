class CommentsController < ApplicationController
  def create
    @pin = Pin.find(params[:pin_id])
    params = comment_params
    params['user_id'] = current_user.id
    @comment = @pin.comments.create(params)
    redirect_to pin_path(@pin)
  end

  private
   def comment_params
     params.require(:comment).permit(:user_id, :body)
   end
end
