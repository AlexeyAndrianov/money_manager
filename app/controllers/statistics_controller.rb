class StatisticsController < ApplicationController
  def index
    @categories = current_user.categories.includes(plans: :plan_charges)
  end
end

