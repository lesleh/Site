class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  scope :with_year_and_month, ->(year, month) {
    d = DateTime.new(year, month, 1).beginning_of_month
    where(created_at: d...d.next_month)
  }

  def self.months
    select(:created_at).group_by {|t| t.created_at.beginning_of_month }.map {|k,_| k}
  end
end
