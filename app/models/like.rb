class Like < ApplicationRecord
    belongs_to :post, foreign_key: 'post_id'
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'

    def update_like_counter
        post.increment!(:likes_counter)
      end
end