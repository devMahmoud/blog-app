require 'rails_helper'

RSpec.describe 'Posts index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom',
                        photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello1', text: 'post1')
    @comment = Comment.create(author: @user, post: @post, text: 'my comment')
    visit user_posts_path(@user.id)
  end

  context 'When starting at post index page' do
    it "I can see the user's profile picture." do
      expect(page).to have_selector("img[src='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80']")
    end

    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
  end
  context 'Posts list' do
    it "I can see a post's title." do
      expect(page).to have_content(@post.title)
    end

    it "I can see some of the post's body." do
      expect(page).to have_content('post1')
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content 'my comment'
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content('Comments:')
      expect(@comment.post.comments_counter).to eq(1)
    end

    it 'the amount of likes should be showed.' do
      expect(page).to have_content 'Likes:'
      expect(@post.likes_counter).to eq(0)
    end

    it 'pagination button should be showed' do
      expect(page).to have_content 'Pagination'
    end

    it 'When I click on a post, it should redirects me to that posts show page.' do
      click_on 'Hello1'
      expect(page).to have_current_path user_post_path(@user.id, @post.id)
    end
  end
end
