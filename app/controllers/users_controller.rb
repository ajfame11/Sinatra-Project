class UsersController < ApplicationController
    get '/signup' do
        erb :'users/signup' 
    end 
    
    post '/signup' do 
        user = User.new(params)
        if user.save
            #binding.pry
            session[:user_id] = user.id
            redirect '/games'
        else
            redirect '/signup'
        end
     end
end