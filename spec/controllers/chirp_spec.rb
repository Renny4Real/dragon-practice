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
end
