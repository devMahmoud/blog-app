require 'rails_helper'

RSpec.describe 'users', type: :request do
  before do
    @first_user = User.create(id: 1, name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  context 'testing users#index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status 200
    end

    it 'renders the correct view' do
      get '/users'
      expect(response).to render_template :index
    end
  end

  context 'testing users#show' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status 200
    end

    it 'renders the correct view' do
      get '/users/1'
      expect(response).to render_template :show
    end
  end
end
