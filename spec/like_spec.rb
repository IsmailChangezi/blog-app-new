# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_like_counter' do
    it 'is available' do
      expect(Like.new).to respond_to(:update_like_counter)
    end
  end
end
