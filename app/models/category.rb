class Category < ActiveRecord::Base
  belongs_to :user
  has_many :plans, dependent: :destroy

	validates :name, presence: true
  validates :name, uniqueness: { scope: :user }
end
