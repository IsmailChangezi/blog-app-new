# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'after_save' do
    let(:post) { Post.create(title: 'Test Post') }
    let(:comment) { Comment.new(content: 'Test Comment', post:) }

    it 'should invoke the update_comment_counter method' do
      expect(comment).to receive(:update_comment_counter)
      comment.save
    end
  end
end
