require 'rails_helper'

RSpec.describe 'posts', type: :request do
  context 'testing posts#index' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status 200
    end

    it 'renders the correct view' do
      get '/users/:user_id/posts'
      expect(response).to render_template :index
    end

    it 'response body includes correct placeholder text' do
      get '/users/:user_id/posts'
      expect(response.body).to include 'list of posts for a given user'
    end
  end

  context 'testing posts#show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status 200
    end

    it 'renders the correct view' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template :show
    end

    it 'response body includes correct placeholder text' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include 'specific post for a given user'
    end
  end
end
