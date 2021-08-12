class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable, :trackable, :validatable
  has_many :listings, dependent: :destroy
  
  after_create :set_default_role
  belongs_to :role, optional: true

  def to_s
    email
  end

  after_create do
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
  end

  private

  def set_default_role
    self.update(role_id: Role.find_by(code: 'default').id)
  end
end
