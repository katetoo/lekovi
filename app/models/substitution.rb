class Substitution < ActiveRecord::Base
  belongs_to :subgroup
  has_many :generic_names, dependent: :destroy
  
  validates :ime_podelba, presence: true
  validates :subgroup_id, presence: true
end