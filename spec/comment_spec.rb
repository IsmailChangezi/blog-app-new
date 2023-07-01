require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'update_comment_counter' do
    let!(:author) { User.create name: 'John Doe', posts_counter: 0 }
    let!(:post) { Post.create author_id: author.id, title: "God's Creations", comments_counter: 0, likes_counter: 0 }
    let!(:comment) do
      Comment.create user_id: author.id, post_id: post.id, text: 'Allahu Akbar! God is GREATTTTT!!'
    end

    it 'should increment comments_counter by one' do
      expect(comment.update_comment_counter.comments_counter).to eq(2)
    end
  end
end
