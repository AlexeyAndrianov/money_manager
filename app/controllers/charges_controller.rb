class ChargesController < ApplicationController
  def create
    @charge = current_user.charges.build(charge_params)
    if @charge.save
      redirect_to charges_path, notice: 'Charge was successfully created'
    else
      render :new
    end
  end

  def edit
    @charge = current_user.charges.find(params[:id])
  end

  def index
    @charges = current_user.charges.with_status(:created_by_user).page(params[:page])
  end

  def destroy
    current_user.charges.find(params[:id]).destroy
    redirect_to charges_path, notice: 'Charge was successfully destroyed'
  end

  def update
    @charge = current_user.charges.find(params[:id])
    if @charge.update(charge_params)
      redirect_to charges_path, notice: 'Charge was successfully updated'
    else
      render :edit
    end
  end

  def new
    @charge = Charge.new
  end


  private

  def charge_params
    params.require(:charge).permit(:amount, :description, :operation_date)
  end
end


