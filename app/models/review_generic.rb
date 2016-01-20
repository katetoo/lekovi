class ReviewGeneric < ActiveRecord::Base
  belongs_to :user
  belongs_to :generic_name
end