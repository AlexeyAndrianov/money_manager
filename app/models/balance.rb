class Balance < ActiveRecord::Base
  belongs_to :user
  has_many :charges

  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  # TODO:
  # add validation that checks that planned amount should be equal or less amount

  def free_amount
    amount - planned_amount
  end
end
