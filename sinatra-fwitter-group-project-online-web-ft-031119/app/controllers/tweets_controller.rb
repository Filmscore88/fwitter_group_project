class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do

  end

  get '/tweets' do
    @tweets = Tweet.all
    erb :'tweets/tweets'
  end
end
