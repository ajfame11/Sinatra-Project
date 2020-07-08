class GameController < ApplicationController

    get '/games' do
        #binding.pry
        @games = Game.all
        erb :'games/all_games'

    end

    get '/games/new' do
        @users = User.all
        erb :'games/create_games'
    end

    post '/games' do
        #binding.pry
        user = User.find_by_id(params[:user_id])
        game = user.games.build(params)

        if game.save
            redirect '/games'
        else
            redirect '/games/new'
        end
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

    get '/games/:id/update' do
        #binding.pry
        @game = Game.find_by_id(params[:id])
        erb :'games/update_games'
    end

    patch '/games/:id' do
        #binding.pry
        game = Game.find_by_id(params[:id])

        if game.update(title: params[:title], description: params[:description])
            redirect '/games/#{game.id}'
        else
            redirect '/games/#{post}/update'
        end
    end

    delete '/games/:id' do
        game = Game.find_by_id(params[:id])
        if game
            game.delete
        end
        redirect '/games'
    end

end