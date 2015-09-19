class AdminController < ApplicationController
  before_action :logged_in?

  def dashboard
    @latest = Sell.latest_sells
    @to_buy = Product.to_buy
  end
end
