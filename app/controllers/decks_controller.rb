class DecksController < ApplicationController
  before_filter :authenticate
  def index
    @decks = current_user.decks
  end
  def show
    @deck = find_deck
    @cards = @deck.cards
  end
  def new
    @deck = Deck.new
  end
  def create
    @deck = find_deck
    @deck.save
    redirect_to decks_path
  end
  def edit
    @deck = current_user.decks.find(params[:id])
  end
  def update
    @deck = find_deck
    @deck.update_attributes(params[:deck])
    redirect_to @deck
  end
  def destroy
    @deck = find_deck
    @deck.destroy
    redirect_to decks_path
  end

  private

  def find_deck
    current_user.decks.find(params[:id])
  end
end
