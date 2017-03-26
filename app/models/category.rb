class Category < ActiveRecord::Base
  belongs_to :user
  has_many :plans

	validates :name, presence: true
  validates :name, uniqueness: { scope: :user }
end
