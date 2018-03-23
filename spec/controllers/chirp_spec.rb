require 'rails_helper'

describe ChirpController do
  describe 'GET index' do
    it 'should set tweetz' do
      get :index
      expect(assigns(:sebs_tweets)).to all(be_a(Twitter::Tweet))
    end
  end

  describe 'POST create' do
    it 'should save a tweet' do
      post :create, params: { id: '942103733839847424' }

      expect(Chirp.first).to have_attributes(text: 'When your @Uber_Support @Uber driver accepts your fare and then gets a MacDonald’s https://t.co/Lh3JiFeYGR', uid: 942103733839847424)
    end
  end
end
