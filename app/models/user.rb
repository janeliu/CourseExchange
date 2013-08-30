class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :college_attributes, :wanted_courses_attributes, :available_courses_attributes, :college_name, :account_attributes 
  
  
  belongs_to :college
  has_one :account
  has_many :registrations

  has_many :wanted_courses, :through => :registrations, :source => :course, :conditions => "registrations.kind = 'wanted'", :dependent => :destroy
  has_many :available_courses, :through => :registrations, :source => :course, :conditions => "registrations.kind = 'available'", :dependent => :destroy
  
  accepts_nested_attributes_for :college, :wanted_courses, :available_courses, :account
  validates_presence_of :username, :email, :college
  # attr_accessible :title, :body
  def college_name
    college.try(:name)
  end

  def college_name=(name)
    if College.find_by_name(name)
      self.college = College.find_by_name(name) if name.present?
    end
  end
end
