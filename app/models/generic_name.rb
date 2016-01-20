class GenericName < ActiveRecord::Base
  belongs_to :substitution
  has_many :medicaments, dependent: :destroy
  has_many :reviewgenerics
  
  validates :genericko_ime, presence: true
  validates :substitution_id, presence: true
  
  validates :sostav, length: {minumum: 5, maximum: 6000}
  validates :indikacii, length: {minumum: 5, maximum: 6000}
  validates :interakcii, length: {minumum: 5, maximum: 6000}
  validates :dejstvo, length: {minumum: 5, maximum: 6000}
  validates :merki_na_pretpazlivost, length: {minumum: 5, maximum: 6000}
  validates :doziranje, length: {minumum: 5, maximum: 6000}
  validates :nesakani_dejstva, length: {minumum: 5, maximum: 6000}
  validates :kontraindikacii, length: {minumum: 5, maximum: 6000}
end