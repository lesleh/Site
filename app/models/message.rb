class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :subject, :body
end
