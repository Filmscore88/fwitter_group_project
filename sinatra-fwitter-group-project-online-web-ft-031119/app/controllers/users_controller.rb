class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
       erb :'users/create_user'
    else
      redirect '/tweets'
    end
  end

  post '/signup' do

    if params[:username] == '' || params[:email] =='' || params[:password] == ''
      redirect '/signup'
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/tweets'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/tweets'
    end
  end

  post '/login' do

    login(params[:username], params[:password])
    #binding.pry
    redirect '/tweets'

  end

  get '/logout' do
    if logged_in?
      log_out
      redirect '/login'
    else
      redirect '/'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
