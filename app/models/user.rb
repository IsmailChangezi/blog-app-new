class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    def recent_posts(limit = 3)
        posts.order(created_at: :desc).limit(limit)
    end
end