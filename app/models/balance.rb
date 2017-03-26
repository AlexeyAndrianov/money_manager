class Balance < ActiveRecord::Base
  belongs_to :user
  has_many :charges

  validates :amount, :planned_amount, numericality: { greater_than_or_equal_to: 0 }

  def free_amount
    amount - planned_amount
  end

end
