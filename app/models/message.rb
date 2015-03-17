class Message < ActiveRecord::Base
  validates_presence_of :name, :subject, :body
  validates_format_of :email, :with => /@/ # Email validation is hard and pointless
end
