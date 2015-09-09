get '/' do
  erb :index
end

post '/update_tweet' do
  $twitter.update(params[:tweet_text])
  redirect to "/"
end