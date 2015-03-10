class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  acts_as_taggable

  scope :with_year_and_month, ->(year, month) {
    d = DateTime.new(year.to_i, month.to_i, 1).beginning_of_month
    where(created_at: d...d.next_month)
  }

  def self.months
    select(:created_at).group_by {|t| t.created_at.beginning_of_month }.map do |k,v|
      {
          date: k,
          count: v.size
      }
    end
  end
end
