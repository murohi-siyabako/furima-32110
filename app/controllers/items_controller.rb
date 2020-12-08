class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_condition_id, :postage_id, :prefecture_id, :prepare_id, :category_id, :image).merge(user_id: current_user.id)
  end

end
