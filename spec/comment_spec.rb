# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comment_counter' do
    it 'validates' do
      expect(Comment.new).to respond_to(:update_comment_counter)
    end
  end
end
