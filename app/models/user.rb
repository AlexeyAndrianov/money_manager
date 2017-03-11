class User < ActiveRecord::Base
  after_create -> { create_balance }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # TODO: refactor with with_options
  has_many :categories, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :charges, dependent: :destroy
  has_many :plan_charges, dependent: :destroy
  has_one :balance, dependent: :destroy
end
