class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  def first_paragraph
    body[/<p>.*?<\/p>/]
  end
end
