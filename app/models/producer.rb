class Producer < ActiveRecord::Base
  has_many :medicaments, dependent: :destroy
  
  validates :ime_proizvoditel, presence: true
  validates :poteklo, presence: true
  mount_uploader :picture, PictureUploader
end