require 'rails_helper'

RSpec.feature 'adding posts' do
  before do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                              bio: 'Teacher from Mexico.',
                              posts_counter: 0)
  end
  scenario 'allow a user to add a post' do
    visit new_user_post_url(@first_user)
    fill_in 'Title', with: 'My Title'
    fill_in 'Text', with: 'My Body'

    click_on('Create Post')

    expect(page).to have_content('My Title')
    expect(page).to have_content('My Body')
  end
end
