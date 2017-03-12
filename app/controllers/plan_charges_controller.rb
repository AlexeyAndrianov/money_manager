class PlanChargesController < ApplicationController
  before_action :set_plan, only: [:new, :create, :destroy]

  def new
    @plan_charge = @plan.plan_charges.build
  end

  def create
    @plan_charge = @plan.plan_charges.build(plan_charges_params.merge(user: current_user))

    if @plan_charge.save
      redirect_to plan_path(@plan), notice: 'Money was successfully postponed!'
    else
      render :new
    end
  end

  def destroy
    @plan.plan_charges.find(params[:id]).destroy
    redirect_to plan_path(@plan), notice: 'Plan charge was successfully destroyed'
  end

  private

  def plan_charges_params
    params.require(:plan_charge).permit(:amount, :plan_id)
  end

  def set_plan
    @plan = current_user.plans.find(params[:plan_id])
  end
end
