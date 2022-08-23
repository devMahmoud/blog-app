require 'rails_helper'

RSpec.describe 'users', type: :feature do
  before do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                              bio: 'Teacher from Mexico.',
                              posts_counter: 0)
    @first_post = Post.create(author: @first_user, title: 'Hello 1', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(author: @first_user, title: 'Hello 2', text: 'This is my 2nd post', comments_counter: 0,
                               likes_counter: 0)
    @third_post = Post.create(author: @first_user, title: 'Hello 3', text: 'This is my 3rd post', comments_counter: 0,
                              likes_counter: 0)
    @fourth_post = Post.create(author: @first_user, title: 'Hello 4', text: 'This is my 4th post', comments_counter: 0,
                               likes_counter: 0)
    visit user_path(@first_user.id)
  end

  context 'testing users#show' do
    it "I can see the user's profile picture." do
      expect(page).to have_selector("img[src='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80']")
    end

    it "I can see the user's username." do
      expect(page).to have_content(@first_user.name.to_s)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@first_user.posts_counter.to_s)
    end

    it "I can see the user's bio." do
      expect(page).to have_content(@first_user.bio.to_s)
    end

    it "I can see the user's first 3 posts." do
      expect(page).to have_no_content(@first_post.title.to_s)
      expect(page).to have_content(@second_post.title.to_s)
      expect(page).to have_content(@third_post.title.to_s)
      expect(page).to have_content(@fourth_post.title.to_s)
    end

    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content('See All Posts')
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      click_on @second_post.title.to_s
      expect(page).to have_current_path user_post_path(@first_user.id, @second_post.id)
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      first(:link, 'See All Posts').click
      expect(page).to have_current_path user_posts_path(@first_user.id)
    end
  end
end
