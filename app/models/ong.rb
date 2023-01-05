class Ong < ApplicationRecord
  include Chargeable
  include Donatable
  belongs_to :city
  belongs_to :province
  belongs_to :user
  belongs_to :category
  belongs_to :status_updated_by, class_name: 'User', optional: true
  belongs_to :updated_by, class_name: 'User'
  has_many :fixed_costs, as: :chargeable
  has_many :donations, through: :fixed_costs
  has_many :item_donations, as: :donatable
  has_many :contributions, through: :item_donations
  has_many_attached :photos
  validates :name, :description, :phone, :email, :video_url, presence: true, allow_blank: false

  def self.search(q)
    where('name ilike ?',"%#{q}%")
  end

  def photos_dev
    photos.map{|p| [p.id, ActiveStorage::Blob.service.path_for(p.key).split('src')[1]]}
  end

end
