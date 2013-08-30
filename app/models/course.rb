class Course < ActiveRecord::Base
  belongs_to :college
  attr_accessible :SLN, :name, :college_attributes, :wanted_users_attributes, :available_users_attributes, :registrations_attributes
  has_many :registrations
  #has_many :users, through => :registrations
  has_many :wanted_users, :through => :registrations, :source => :user, :conditions => "registrations.kind = 'wanted'", :dependent => :destroy
  has_many :available_users, :through => :registrations, :source => :user, :conditions => "registrations.kind = 'available'", :dependent => :destroy

  accepts_nested_attributes_for :college, :wanted_users, :available_users, :registrations

  validates :name, :presence => true
  validates :SLN, :presence => true
  #validates_uniqueness_of :SLN
end
