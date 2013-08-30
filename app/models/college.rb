class College < ActiveRecord::Base
  attr_accessible :name, :users_attributes, :courses_attributes
  has_many :courses, :dependent => :destroy
  has_many :users
  accepts_nested_attributes_for :courses, :users
end
