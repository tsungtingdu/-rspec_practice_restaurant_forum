class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  # 這裡我們只使用index 這個 template，所以統一 render or redirect 到 index

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
   @category = Category.new(category_params)
   if @category.save
     flash[:notice] = "category was successfully created"
     redirect_to admin_categories_path
   else
     @categories = Category.all
     render :index
   end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
