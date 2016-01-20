class Subgroup < ActiveRecord::Base
  belongs_to :group
  has_many :substitutions, dependent: :destroy
  
  validates :ime_podgrupa, presence: true
  validates :group_id, presence: true
end