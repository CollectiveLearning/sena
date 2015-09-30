class SellsController < ApplicationController
  before_action :logged_in?

  def new
    @sell = Sell.new
  end

  def create
    @sell = Sell.new(sell_params)
    if @sell.save
      redirect_to '/sells'
    else
      render :new
    end
  end

  def index
    @sells = Sell.all
  end

  def sell_params
    params.require(:sell).permit(:product_id, :quantity)
  end
end
