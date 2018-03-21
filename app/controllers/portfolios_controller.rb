class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[edit show destroy update]
  access all: %I[show index], user: {except: %I[destroy update new edit create sort] }, site_admin: :all
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @anuglar_portfolio_item = Portfolio.angular
  end

  def new
    @portfolio = Portfolio.new
    # nested attrbites.. added in the model
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    if @portfolio_item.save
      redirect_to @portfolio_item, notice: 'success'
    else
      redirect_to portfolios_path, notice: 'failure'
    end
  end

  def edit
    3.times { @portfolio_item.technologies.build }
  end

  def show() end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to @portfolio_item, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    redirect_to portfolios_path, notice: "#{@portfolio_item.title}, fue destruido"
  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio)
          .permit(:title, :subtitle, :body,
                  :main_image, :thumb_image,
                  technologies_attributes: [:name])
  end
end
