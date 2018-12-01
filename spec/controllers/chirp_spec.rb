require 'rails_helper'

describe ChirpController do
  render_views

  describe 'GET index' do
    it 'should set tweetz' do
      sleep 1 # don't hit rate limit 
      begin
        get :index
        expect(assigns(:sebs_tweets)).to all(be_a(Twitter::Tweet))
      rescue Twitter::Error::TooManyRequests
        sleep 1 # don't hit rate limit
        retry
      end
    end

    it 'should set the scene' do
      sleep 1 # don't hit rate limit
      begin
        get :index
        expect(response.body).to include('Great Seb Tweets!')
      rescue Twitter::Error::TooManyRequests
        sleep 1 # don't hit rate limit
        retry
      end
    end

    it 'should show nice names' do
      sleep 1 # don't hit rate limit
      begin
        get :index
        expect(response.body).to include('<strong class="name">')
      rescue Twitter::Error::TooManyRequests
        sleep 1 # don't hit rate limit
        retry
      end
    end

    it 'should be a 200' do
      sleep 1 # don't hit rate limit
      begin
        get :index
        expect(response.status).to eq(200)
      rescue Twitter::Error::TooManyRequests
        sleep 1 # don't hit rate limit
        retry
      end
    end

    it 'should be a html page' do
      sleep 1 # don't hit rate limit
      begin
        get :index
        expect(response.headers['Content-Type']).to eq('text/html; charset=utf-8')
      rescue Twitter::Error::TooManyRequests
        sleep 1 # don't hit rate limit
        retry
      end
    end
  end

  describe 'POST create' do
    it 'should save a tweet' do
      post :create, params: { id: '942103733839847424' }

      expect(Chirp.first).to have_attributes(text: 'When your @Uber_Support @Uber driver accepts your fare and then gets a MacDonald’s https://t.co/Lh3JiFeYGR', uid: 942103733839847424)
    end


    it 'should display a sad face when twitter is down' do
      allow_any_instance_of(Twitter::REST::Client).to receive(:status).and_raise('holy moly')
      post :create, params: { id: '942103733839847424' }

      expect(response.body).to include('😞')
    end
  end

  describe 'best tweet' do
    let(:best) { ChirpController::TweetsWithBestTweetMarkedAsTheBestTweeter.new }
    
    class TweetOneStub
      def favorite_count
        1
      end

      def marked_as_best_tweet
        @x
      end

      def marked_as_best_tweet=(x)
        @x = x
      end
    end

    class TweetTwoStub
      def favorite_count
        11
      end

      def marked_as_best_tweet
        @x
      end

      def marked_as_best_tweet=(x)
        @x = x
      end
    end

    class TweetThreeStub
      def favorite_count
        5
      end

      def marked_as_best_tweet
        @x
      end

      def marked_as_best_tweet=(x = false)
        @x = x
      end
    end

    it 'returns the best tweet' do
      tweet_1, tweet_2, tweet_3 = TweetOneStub.new, TweetTwoStub.new, TweetThreeStub.new
      #tweet_1.marked_as_best_tweet, tweet_2.marked_as_best_tweet, tweet_3.marked_as_best_tweet = false
      tweets = [tweet_1, tweet_2, tweet_3]
      best.get_tweets_with_best_tweet_marked_as_the_best_tweet(tweets)
      expect(tweet_2.marked_as_best_tweet).to eq(true)
      expect(tweet_1.marked_as_best_tweet).to eq(false)
      expect(tweet_3.marked_as_best_tweet).to eq(false)
    end
  end
end
