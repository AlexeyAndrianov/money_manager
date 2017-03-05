class Plan < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user
  belongs_to :category

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, :category_id, presence: true

  after_save :update_balance_planned_amount


  private

  def update_balance_planned_amount
    balance = user.balance
    current_planned_amount = balance.planned_amount

    user.balance.update_attribute(:planned_amount, current_planned_amount + amount)
  end
end
