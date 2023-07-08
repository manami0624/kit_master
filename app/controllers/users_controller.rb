class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @words = current_user.words.page(params[:page]).per(1)
    @total_posts = current_user.words.count
  end
end
