class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  def first_paragraph
    body[/<p>.*?<\/p>/]
  end
end
