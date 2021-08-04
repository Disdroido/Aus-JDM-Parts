class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable, :trackable, :validatable
  has_many :listings, dependent: :destroy

  def admin?
    has_role?(:admin)
  end
end
