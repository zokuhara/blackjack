class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find params[:id]
  end

  def create
    @game = Game.create
    redirect_to game_path(id: @game.id)
  end

  def hit
    @game = Game.find params[:id]
  end
end
