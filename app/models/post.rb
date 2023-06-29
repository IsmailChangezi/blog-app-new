class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes

    after_save :post_counter_update

    def most_recent_comments
      comments.order(created_at: :desc).limit(5)
    end
  
    private
  
    def post_counter_update
      author.increment!(:posts_counter)
    end
end