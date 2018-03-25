module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('TWITTER_KEY')
      config.consumer_secret     = ENV.fetch('TWITTER_SECRET')
      config.access_token        = ENV.fetch('TWITTER_ACCESS_TOKEN')
      config.access_token_secret = ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET')
    end
    client.search('#rails', result_type: 'recent').take(6).collect do |tweet|
      { name: tweet.user.screen_name, text: tweet.text }
    end
  end
end
