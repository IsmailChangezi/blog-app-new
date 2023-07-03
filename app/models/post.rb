class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes

  after_save :post_counter_update

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def post_counter_update
    author.increment!(:posts_counter)
  end
end
