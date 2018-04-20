class ChirpController < ApplicationController
  def index
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'WviMM9oNLIrHR3e8msqhArrCc'
      config.consumer_secret = 'eEeXT47buv8DYifAYur7kwWLoyCxGgO82NzSdQB2kGVgKBby8n'

      config.access_token = '39367861-iFSHAnxRY9fqJ9s4RobnMxsWIXCxqpzhttobpCsQn'
      config.access_token_secret = 'wP0l8mQ6GWJ774CnQOFqLpYfWqoUGMLaDXGDa2dvtsLsE'
    end
    @sebs_tweets = twitter_client.home_timeline
  end

  def create
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'WviMM9oNLIrHR3e8msqhArrCc'
      config.consumer_secret = 'eEeXT47buv8DYifAYur7kwWLoyCxGgO82NzSdQB2kGVgKBby8n'

      config.access_token = '39367861-iFSHAnxRY9fqJ9s4RobnMxsWIXCxqpzhttobpCsQn'
      config.access_token_secret = 'wP0l8mQ6GWJ774CnQOFqLpYfWqoUGMLaDXGDa2dvtsLsE'
    end
    begin
      great_tweet = twitter_client.status(params[:id])
      Chirp.create(text: great_tweet.text, uid: great_tweet.id )
      redirect_to '/'
    rescue
      render plain: '😞'
    end
  end
end
