class WordsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @words = Word.all
    @words = Word.all.order(created_at: :ASC).page(params[:page])
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

  private
  def word_params
    params.require(:word).permit(:korean, :japanese).merge(user_id: current_user.id)

  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
