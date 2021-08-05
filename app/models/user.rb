class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable, :trackable, :validatable
  has_many :listings, dependent: :destroy
  
  after_create :set_default_role
  belongs_to :role, optional: true

  private

  def set_default_role
    self.update(role_id: Role.find_by(code: 'default').id)
  end
end
