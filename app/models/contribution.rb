class Contribution < ApplicationRecord
  belongs_to :item_donation
  belongs_to :user
  belongs_to :status_updated_by, class_name: 'User'

  enum status: [:pendiente, :entregado, :no_entregado]

  before_create :gen_code

  def gen_code
    code = SecureRandom.urlsafe_base64(6)
  end
end
