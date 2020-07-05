class GameController < ApplicationController

    get '/games' do
        @games = Game.all
        erb :'games/all_games'

    end

end