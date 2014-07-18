class FlashcardsController < ApplicationController
  before_action :find_deck
  before_action :get_flashcard, except: [:new, :create]

  def show
    #@flashcards = @deck.flashcards.paginate(page: params[:page], per_page: 1).order('created_at ASC')
    @current_id = @flashcard.id
    @prev_id = @current_id - 1
    @next_id = @current_id + 1
    @last_id = @deck.flashcards.last.id
    r = Random.new
    @random_id = r.rand(1..@last_id)

    if params[:swap]
     session[:swap] = session[:swap].nil? ? true : !session[:swap]
    end

    if session[:swap]
      @front_content = @flashcard.side_one
      @back_content = @flashcard.side_two
    else
      @front_content = @flashcard.side_two
      @back_content = @flashcard.side_one
    end

  end

  def new
    @flashcard = @deck.flashcards.build
  end

  def create
    @flashcard = @deck.flashcards.build(flashcard_params)
    if @flashcard.save
      redirect_to @deck, notice: "Flashcard Added"
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @flashcard.update_attributes(flashcard_params)
      flash[:success] = "Flashcard updated successully."
      redirect_to deck_flashcard_path(@deck, @flashcard)
    else
      render 'edit'
    end
  end


  def destroy
    @flashcard.destroy
    redirect_to @deck, notice: "Flashcard was removed from deck"
  end

private

  def flashcard_params
      params.require(:flashcard).permit(:side_one, :side_two)
  end

  def find_deck
    @deck = Deck.find(params[:deck_id])
  end

  def get_flashcard
    @flashcard = @deck.flashcards.find_by_id(params[:id])
  end

end
