class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  scope :with_year_and_month, ->(year, month) {
    where("strftime('%m', created_at) = ? AND strftime('%Y', created_at) = ?", "%02d" % month, year.to_s)
  }

  def self.months
    select(:created_at).group_by {|t| t.created_at.beginning_of_month }.map {|k,_| k}
  end
end
