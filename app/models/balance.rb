class Balance < ActiveRecord::Base
  belongs_to :user
  has_many :charges

  validates :amount, numericality: { greater_than_or_equal_to: 0 } 
end
