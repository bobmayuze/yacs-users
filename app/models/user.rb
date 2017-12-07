class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one :profile
  before_create :build_profile

  private

  # def create_profile
  #   Profile.create!(user: self)
  # end

end