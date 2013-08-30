class Registration < ActiveRecord::Base
  attr_accessible :kind, :user_attributes, :course_attributes, :user_id, :course_id 

  belongs_to :user
  belongs_to :course

  accepts_nested_attributes_for :user, :course

end
