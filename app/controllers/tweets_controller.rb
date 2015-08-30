class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(15)
    @replies = Reply.includes(:user).order("created_at DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
    @replies = @tweet.replies.order("created_at DESC")
  end

  def new
  end

  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    tweet = Tweet.find(id_params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
    redirect_to action: :index
  end

  def search
    @tweets = Tweet.where('text LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC")
  end

  private
  def tweet_params
    params.permit(:text)
  end

  def id_params
    params.permit(:id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
