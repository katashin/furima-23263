class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @category = Category.find(@item.category_id)
    @sales_status = SalesStatus.find(@item.sales_status_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @shapping_fee_status = ShappingFeeStatus.find(@item.shapping_fee_status_id)
    @scheduled_delivery = ScheduledDelivery.find(@item.scheduled_delivery_id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shapping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
