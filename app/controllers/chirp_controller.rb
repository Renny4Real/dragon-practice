class ChirpController < ApplicationController
  def index
    @sebs_tweets = SecretSquirrel.twitter_client.home_timeline
  end

  def create
    great_tweet = SecretSquirrel.twitter_client.status(params[:id])
    Chirp.create(text: great_tweet.text, uid: great_tweet.id )
    redirect_to '/'
  end
end
