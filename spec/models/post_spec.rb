require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Testing Post validations and methods' do
    subject { Post.new(title: 'Greeting', text: 'Hello!!!!!') }

    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title must not exceed 250 characters' do
      subject.title = 'h' * 251
      expect(subject).to_not be_valid
    end

    it 'comments counter should be integer greater than or equal to zero' do
      subject.comments_counter = -5
      expect(subject).to_not be_valid
    end

    it 'likes counter should be integer greater than or equal to zero' do
      subject.likes_counter = -5
      expect(subject).to_not be_valid
    end
  end
end
