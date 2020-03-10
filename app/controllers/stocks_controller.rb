class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.html { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          format.html { render partial: 'users/result' }
          flash.now[:alert] = "Please enter a valid ticker"
        end
      end
    else
      respond_to do |format|
        format.html { render layout: false, content_type: 'users/result' }
        flash.now[:alert] = "Please enter a ticker"
      end
    end
  end
end

