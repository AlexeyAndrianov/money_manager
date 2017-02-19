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
    @charge = Charge.find(params[:id])
  end

  def index
    @charges = current_user.charges
  end

  def desroy
    @charge = Charge.find(params[:id])
    @charge.destroy
  end

  def update
    @charge = Charge.find(params[:id])
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


