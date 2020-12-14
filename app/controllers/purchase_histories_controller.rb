class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase_history, only: [:index, :create]
  def index
    @user_item = UserItem.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @user_item = UserItem.new(purchase_history_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_history_params
    params.require(:user_item).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def set_purchase_history
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_history_params[:token],
        currency: 'jpy'
      )
  end

end