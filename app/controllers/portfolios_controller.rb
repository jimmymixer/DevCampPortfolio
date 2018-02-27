class PortfoliosController < ApplicationController

  # Controller should only handle the data flow

  def index
    @portfolio_items = Portfolio.all
    # @portfolio_items = Portfolio.where(subtitle: 'Angular')

    # Custom Scope 1
    # .angular is a custom scope defined in portfolio.rb models file
    # @portfolio_items = Portfolio.angular

    # Custom Scope 2
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end

  # Custom Action
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your Portfolio Item is now live..." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: "Your record was successfully updated..." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: "Portfolio Item was removed..." }
    end
  end

  private



end
