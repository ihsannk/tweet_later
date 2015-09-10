get '/' do
	"<h1> #{session[:username]}!</h1>"
  erb :index
end

post '/update_tweet' do
  @user = User.find_by(twitter_handle: session[:username])
  @tweet = @user.create_user
  @tweet.update(params[:tweet_text])
  redirect to "/"
end