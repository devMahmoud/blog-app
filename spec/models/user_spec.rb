require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing User validations and methods' do
    subject { User.new(name: 'Mahmoud') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts counter should be integer greater than or equal to zero' do
      subject.posts_counter = -5
      expect(subject).to_not be_valid
    end
  end
end
