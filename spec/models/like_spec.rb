require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Testing Like validations and methods' do
    user = User.create(name: 'Mahmoud', photo: 'photo1', bio: 'Web Developer...', posts_counter: 0)
    post = Post.create(author: user, title: 'Hello!', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    like = Like.create(post:, author: user)

    it 'author_id should be equal to user_id' do
      expect(like.author_id).to eq(user.id)
    end

    it 'post_id should be equal to Post.id' do
      p like.post_id
      expect(like.post_id).to eq(post.id)
    end

    it 'likes_counter should be equal to 1' do
      post = Post.find(like.post_id)
      expect(post.likes_counter).to eq(1)
    end
  end
end
