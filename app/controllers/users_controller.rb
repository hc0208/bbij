class UsersController < ApplicationController
  def show
    users = User.find(params[:id])
    @nickname = users.nickname
    @tweets = users.tweets.page(params[:page]).per(15).order("created_at DESC")
    @introduce = users.introduce
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :introduce, :avatar)
  end

end
