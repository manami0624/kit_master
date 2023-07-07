class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_words, only: [:index, :search]
  
  def index
    @total_posts = current_user.words.count if user_signed_in?
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(word_params)
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update(word_params)
  end

  def search
    keyword = params[:keyword].to_s.strip
    if keyword.empty?
      redirect_to root_path
    else
      @words = Word.search(keyword)
    end
  end

  private

  def set_words
    if user_signed_in?
      user_posts = current_user.words
      @total_posts = user_posts.count
      @words = user_posts.order(created_at: :ASC).page(params[:page])
    else
      @words = Word.all.order(created_at: :ASC).page(params[:page])
    end
  end

  def word_params
    params.require(:word).permit(:korean, :japanese).merge(user_id: current_user.id)
  end
end
