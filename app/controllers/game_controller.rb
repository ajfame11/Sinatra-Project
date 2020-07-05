class GameController < ApplicationController

    get '/games' do
        @games = Game.all
        erb :'games/all_games'

    end

    get '/games/:id' do
        #binding.pry
        @game = Game.find_by_id(params[:id])

            if @game
                erb :'games/read_games'
            else
                redirt '/games'
            end
    end

    

end