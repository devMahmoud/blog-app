require 'rails_helper'

RSpec.describe 'users', type: :request do
  context 'testing users#index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status 200
    end

    it 'renders the correct view' do
      get '/users'
      expect(response).to render_template :index
    end

    it 'response body includes correct placeholder text' do
      get '/users'
      expect(response.body).to include 'List of all users'
    end
  end

  context 'testing users#show' do
    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status 200
    end

    it 'renders the correct view' do
      get '/users/:id'
      expect(response).to render_template :show
    end

    it 'response body includes correct placeholder text' do
      get '/users/:id'
      expect(response.body).to include 'Profile page for a given user'
    end
  end
end
