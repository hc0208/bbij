class RepliesController < ApplicationController
  def new
   @tweet = Tweet.find(params[:tweet_id])
   @reply = Reply.new
   @reply.tweet_id = @tweet.id
  end

  def create
    @reply = Reply.create(create_params)
  end
  def destroy
    reply = Reply.find(id_params[:id])
    if reply.user_id == current_user.id
      reply.destroy
    end
  end

  private
  def create_params
    params.require(:reply).permit(:tweet_id, :text).merge(user_id: current_user.id)
  end
  def id_params
    params.permit(:id)
  end
end
