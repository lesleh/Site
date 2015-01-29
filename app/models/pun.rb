class Pun < ActiveRecord::Base
  validates_presence_of :text

  scope :random, -> { order("RANDOM()").limit(1).first }
end
