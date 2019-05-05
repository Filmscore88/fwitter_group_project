class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/tweets/tweets'
    else
    erb :'/users/create_user'
    end
  end

  post '/signup' do

    if params[:username] == '' || params[:email] =='' || params[:password] == ''
      redirect '/signup'
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/tweets/tweets'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/tweets/tweets'
    end
      erb :'users/login'
    end

  post '/login' do
    login(params[:username], params[:password])
    redirect '/tweets/tweets'
  end
end
