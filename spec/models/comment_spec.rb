require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Testing Comment validations and methods' do
    user = User.create(name: 'Mahmoud', photo: 'photo1', bio: 'Web Developer...', posts_counter: 0)
    post = Post.create(author: user, title: 'Hello!', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    comment = Comment.create(text: 'This is my first comment', post:, author: user)

    it 'author_id should be equal to user_id' do
      expect(comment.author_id).to eq(user.id)
    end

    it 'post_id should be equal to Post.id' do
      p comment.post_id
      expect(comment.post_id).to eq(post.id)
    end

    it 'comments_counter should be equal to 1' do
      post = Post.find(comment.post_id)
      expect(post.comments_counter).to eq(1)
    end
  end
end
