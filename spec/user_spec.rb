require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Malik44', photo: 'https://malik44.jpg', bio: 'Sailor', posts_counter: 0) }

  before { subject.save }

  context 'when created' do
    it 'has an id' do
      expect(subject.id).not_to be_nil
    end
  end

  context 'when name is not present' do
    before { subject.name = nil }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when name is present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when posts_counter is not a number' do
    before { subject.posts_counter = 'one' }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when posts_counter is a number' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when posts_counter is less than 0' do
    before { subject.posts_counter = -1 }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'last_three_posts' do
    let(:author_two) { User.new(name: 'Akai321', photo: 'https://Akaiiii.jpg', bio: 'Martial Artist', posts_counter: 0) }
    let(:post1) { Post.new author_id: author_two.id, title: 'Prayer', comments_counter: 0, likes_counter: 0 }
    let(:post2) { Post.new author_id: author_two.id, title: 'Zakat', comments_counter: 0, likes_counter: 0 }
    let(:post3) { Post.new author_id: author_two.id, title: 'Fasting', comments_counter: 0, likes_counter: 0 }

    it 'should return  3 elements' do
      author_two.save
      post1.save
      post2.save
      post3.save
      expect(author_two.most_recent_posts.length).to eq(3)
    end
  end
end
