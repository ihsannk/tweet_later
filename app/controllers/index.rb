get '/' do
  erb :index
end

post '/update_tweet' do
  @user = User.find_by(twitter_handle: session[:username])
  @tweet = @user.create_user
  @tweet.update(params[:tweet_text])
  redirect to "/"
end

get '/public' do
  "This is the public page - everybody is welcome!"
end

get '/private' do
  halt(401, 'Not Authorized') unless admin?
  "This is the private page - members only"
end

get '/login' do
  session[:admin] = true
  "You are now logged in"
  redirect to("/auth/twitter")
end

get '/auth/twitter/callback' do
  session[:admin] = true
  # byebug
  # env['omniauth.auth'] => shows information from twitter in hash
  # {}"<h1>Hi #{env['omniauth.auth']['info']['name']}!</h1><img src='#{env['omniauth.auth']['info']['image']}'>" => welcome message with picture using omniauth
  # session[:username] = env['omniauth.auth']['info']['name'] => store logged in user
  @user = User.find_or_create_by(
  	twitter_handle: env['omniauth.auth']['info']['nickname'], 
  	access_token: env['omniauth.auth']['credentials']['token'], 
  	access_token_secret: env['omniauth.auth']['credentials']['secret']
  	)
  @user.create_user
  session[:username] = @user.twitter_handle
  redirect to '/'
end

get '/auth/failure' do 
	params[:message]
end

get '/logout' do
	session[:admin] = nil
	"You are now logged out"
end