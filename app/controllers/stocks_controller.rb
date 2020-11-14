class StocksController < ApplicationController
  before_action :login_required

  def index
    @users = User.all
    @stocks =Stock.all
  end
  
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to root_path
      return
    else
      flash.now[:alert] = '追加できませんでした'
      render :new
    end
  end

  def show
    stocks = stock_url(params[:id])
    @stocks = Stock.all
  end


  def edit
    @stocks = Stock.find(params[:id])
  end

  def update
    @stocks = Stock.find(params[:id])
    @stocks.update(update_params)
    redirect_to root_path
  end 

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.destroy
      redirect_to root_path
    end
  end
  private

  def login_required 
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end

  def update_params
    params.permit(:count)
  end

  def stock_params
    params.require(:stock).permit(:name,:count)
  end

end
