class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :books

  validates :email, presence: true
end

