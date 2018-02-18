class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[edit show destroy]

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    if @portfolio.save
      redirect_to @portfolio, notice: 'success'
    else
      redirect_to portfol, notice: 'failure'
    end
  end

  def edit() end

  def show() end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path, notice: "#{@portfolio.title}, fue destruido"
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

end
