class Book < ActiveRecord::Base
  belongs_to :user
  attr_accessible :author, :title
end
