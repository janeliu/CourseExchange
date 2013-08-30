class Account < ActiveRecord::Base
  attr_accessible :user_attributes
  belongs_to :user
  accepts_nested_attributes_for :user

end
