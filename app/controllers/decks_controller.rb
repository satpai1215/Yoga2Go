class DecksController < ApplicationController

  def index
    @decks = Deck.all
  end

  def show
     @deck = Deck.find(params[:id])
    @flashcards = @deck.flashcards.paginate(page: params[:page], per_page: 20).order('created_at ASC')
  end

private
  def deck_params
      params.require(:deck).permit(:title)
  end
end
