class GamesController < ApplicationController

    get '/games' do
        redirect_if_not_logged_in
            #binding.pry
            @games = current_user.games
            erb :'games/all_games'
    end

    get '/games/' do #Temporary fix for update_games.erb
        redirect_if_not_logged_in
            #binding.pry
            @games = current_user.games
            erb :'games/all_games'
    end

    get '/games/new' do
        redirect_if_not_logged_in
            erb :'games/create_games'
    end

    post '/games' do
        redirect_if_not_logged_in
            #binding.pry
            game = current_user.games.build(params)

            if game.save
                redirect '/games'
            else
                redirect '/games/new'
            end
    end

    get '/games/:id' do
        #binding.pry
        redirect_if_not_logged_in
            @game = current_user.games.find_by_id(params[:id])

                if @game
                    erb :'games/read_games'
                else
                    redirect '/games'
                end
    end

    get '/games/:id/update' do
        #binding.pry
        redirect_if_not_logged_in
            @game = current_user.games.find_by_id(params[:id])
            if @game
                erb :'games/update_games'
            else
                redirect '/games'
            end
    end

    patch '/games/:id' do
        #binding.pry
        redirect_if_not_logged_in
            game = current_user.games.find_by_id(params[:id])
            if game
                if game.update(title: params[:title], description: params[:description])
                    redirect '/games/#{game.id}'
                else
                    redirect '/games/#{game}/update'
                end
            else
                redirect '/games'
            end
    end

    delete '/games/:id' do
        redirect_if_not_logged_in
            game = Game.find_by_id(params[:id])
            if game
                game.delete
            end
            redirect '/games'
    end

end