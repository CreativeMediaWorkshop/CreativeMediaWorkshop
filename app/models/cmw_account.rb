class CmwAccount < ActiveRecord::Base
  # ROLES = ['admin', 'user', 'verified', 'banned']
  validates :name, uniqueness: true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
 