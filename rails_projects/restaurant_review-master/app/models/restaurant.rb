class Restaurant < ActiveRecord::Base
  has_many :reviews
  #has_many :customers, through: :reviews, class_name: 'User'
end