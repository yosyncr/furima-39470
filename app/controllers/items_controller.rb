class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item,except: [:show,:edit,:update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def new
  @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
       render :edit, status: :unprocessable_entity
    end
  end
  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :fee_id, :region_id, :delivery_id,:price , :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
