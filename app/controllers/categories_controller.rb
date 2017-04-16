class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.page(params[:page])
  end

  def edit
    @category = Category.includes(:plans).find_by(id: params[:id], user: current_user)
  end

  def update
    @category = current_user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated'
    else
      render :edit
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path, notice: 'Category was successfully deleted'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

