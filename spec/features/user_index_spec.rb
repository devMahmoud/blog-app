require 'rails_helper'

RSpec.describe 'users index', type: :feature do
  before do
    @first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Mexico.', posts_counter: 0)
    @second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1523506591153-1504ba186b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80', bio: 'Teacher from Poland.', posts_counter: 0)
    visit users_path
  end

  context 'testing users#index' do
    
    it 'I can see the username of all other users.' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_selector("img[src='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80']")
      expect(page).to have_selector("img[src='https://images.unsplash.com/photo-1523506591153-1504ba186b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80']")
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
      expect(page).to have_content("Number of posts: #{@second_user.posts_counter}")
    end

    it "When I click on a user, I am redirected to that user's show page." do
      click_on 'Tom'
      expect(page).to have_current_path user_path(@first_user.id)
    end
  end
end
