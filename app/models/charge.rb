class Charge < ActiveRecord::Base
  belongs_to :user

  delegate :balance, to: :user

  after_save :update_balance_amount
  after_destroy :update_balance_amount

  validates :amount, presence: true

  # add validation that amount COULD NOT BE EMPTY as well as operation_date!!!!!!!!!!!!!!!!!!

  private

  def update_balance_amount
    balance.update_attribute(:amount, user.charges.sum(:amount))
  end
end
