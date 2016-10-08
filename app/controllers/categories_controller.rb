class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  # admin only
  def create
    @category = Category.new(category_params)

  	if @category.save
  		redirect_to categories_path, notice: 'Category created'
  	else
  		render :new, notice: 'Something went wrong - please try again'
  	end
  end

  # admin only
  def new
    @category = Category.new
  end

  # admin only
  def edit
    @category = Category.find(params[:id])
  end

  # admin only
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_url
    else
      render "edit"
    end

  end

  # admin only
  def destroy
    Category.find(params[:id]).delete
    redirect_to categories_url
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end

end
