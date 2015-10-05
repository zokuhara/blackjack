class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find params[:id]
    #if player_hand.is_finished   && !dealer_hand is finished ? _dealer_response(game)
    if @game.player_hand.is_finished && !@game.dealer_hand.is_finished
      game._dealer_response(game)
    end

    #if dealer_hand.is_finished ... game.evaluate_score_to_determine_winner # ->returns  "«winner»"

  end

  def create
    @game = Game.create
    @game.build_cards
    player_hand = Hand.create game_id: @game.id, player: true
    dealer_hand = Hand.create game_id: @game.id, player: false

    2.times do
      @game.player_hand.cards << @game.deck.first
      @game.dealer_hand.cards << @game.deck.second
    end

    redirect_to game_path(id: @game.id)
  end

  def player_hit
    @game = Game.find params[:id]
    @game.player_hand.cards << @game.deck.first

    redirect_to game_path(id: @game.id)
  end

  def _dealer_response(g)
    if g.dealer_hand.total <= 16
      # dealer hits
      g.dealer_hand.cards << g.deck.first
    else
      #dealer stays
      g.dealer_hand.is_finished = true
    end

    g.save

    redirect_to game_path(id: g.id)

  end

  def end_player_turn

    #query for the game from database w/ Game.find_by
    @game = Game.find params[:id]
    @game.player_hand.is_finished = true
    #save @game
    #redirect to game_path with @game's :id

    @game.save
    redirect_to game_path(id: @game.id)
  end

end
