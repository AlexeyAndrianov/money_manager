class PlansController < ApplicationController
  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      redirect_to charges_path, notice: 'Plan was successfully created'
    else
      render :new
    end
  end

  def edit
    @plan = current_user.plans.find(params[:id])
  end

  def index
    @plans = current_user.plans.page(params[:page])
  end

  def show
    @plan = Plan.includes(:plan_charges).find_by(user: current_user, id: params[:id])
  end

  def desroy
    @plan = current_user.plans.find(params[:page])
    @plan.destroy
  end

  def update
    @plan = current_user.plans.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path, notice: 'Plan was successfully updated'
    else
      render :edit
    end
  end

  def new
    @plan = Plan.new
  end

  def complete
    @plan = current_user.plans.find(params[:id])

    flash_message = if @plan.update_attributes(status: :completed)
      'Plan was successfully updated'
    else
      'Plan can not be completed'
    end

    redirect_to plan_path(@plan), notice: flash_message
  end


  private

  def plan_params
    params.require(:plan).permit(:amount, :name, :category_id, :start_date, :end_date)
  end
end
