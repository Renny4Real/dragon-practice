class ChirpController < ApplicationController
  def index
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'WviMM9oNLIrHR3e8msqhArrCc'
      config.consumer_secret = 'eEeXT47buv8DYifAYur7kwWLoyCxGgO82NzSdQB2kGVgKBby8n'

      config.access_token = '39367861-iFSHAnxRY9fqJ9s4RobnMxsWIXCxqpzhttobpCsQn'
      config.access_token_secret = 'wP0l8mQ6GWJ774CnQOFqLpYfWqoUGMLaDXGDa2dvtsLsE'
    end
    begin
      @sebs_tweets = TweetsWithBestTweetMarkedAsTheBestTweeter.new.get_tweets_with_best_tweet_marked_as_the_best_tweet(twitter_client.home_timeline)
    rescue
      @sebs_tweets = twitter_client.home_timeline
    end
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

  module AddIsBestAttribute
    attr_accessor :marked_as_best_tweet

    def best_tweet?
      marked_as_best_tweet || false
    end
  end

  Twitter::Tweet.prepend(AddIsBestAttribute)

  class TweetsWithBestTweetMarkedAsTheBestTweeter
    def get_tweets_with_best_tweet_marked_as_the_best_tweet(tweets)
      best_tweet = tweets.sort_by(&:favorite_count).last

      tweets.map do |tweet|
        tweet.marked_as_best_tweet = true if tweet == best_tweet
        tweet
      end
    end
  end
end
