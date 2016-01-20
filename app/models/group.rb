class Group < ActiveRecord::Base
  has_many :subgroups, dependent: :destroy
  
  validates :ime_grupa, presence: true, length: {minumum: 5, maximum: 100}
end