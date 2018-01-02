class User < ApplicationRecord
  belongs_to :role
  has_many :rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :first_name,:last_name,:username,:email,:mobile_number,:role_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username,:email
  before_validation :assign_guest_role_to_who_ever_logins
  def assign_guest_role_to_who_ever_logins
     if(self.role_id==nil)
        binding.pry
        self.role_id = Role.last.id
        binding.pry
     end 
  end	
  def role?(rolename)
     self.role.name==rolename
  end      
 
end
