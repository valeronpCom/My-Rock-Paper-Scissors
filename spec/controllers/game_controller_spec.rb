# frozen_string_literal: true

require 'rails_helper'

describe GameController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #play' do
    it 'redirects to result with correct parameters' do
      allow_any_instance_of(ThrowGenerator).to receive(:call).and_return('rock')
      get :play, params: { move: 'paper' }
      expect(response).to redirect_to(result_path(result: 'You win!', user_move: 'paper', server_throw: 'rock'))
    end
  end

  describe 'GET #result' do
    it 'assigns the correct instance variables' do
      get :result, params: { user_move: 'paper', server_throw: 'rock', result: 'You win!' }
      expect(assigns(:user_move)).to eq('paper')
      expect(assigns(:server_throw)).to eq('rock')
      expect(assigns(:result)).to eq('You win!')
    end
  end
end
