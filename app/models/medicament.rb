class Medicament < ActiveRecord::Base
    belongs_to :producer
    belongs_to :generic_name
    has_many :reviewmeds
    
    validates :ime_lek, presence: true
    validates :generic_name_id, presence: true
    validates :producer_id, presence: true
end