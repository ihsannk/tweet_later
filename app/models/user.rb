class User < ActiveRecord::Base
  has_many :tweets

	def create_user
		$twitter = Twitter::REST::Client.new do |config|
		  config.consumer_key        = API_KEYS["TWITTER_CONSUMER_KEY"]
		  config.consumer_secret     = API_KEYS["TWITTER_CONSUMER_SECRET"]
		  config.access_token        = self.access_token
		  config.access_token_secret = self.access_token_secret
		end
	end
end
