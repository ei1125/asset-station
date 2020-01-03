class MonthsController < ApplicationController
  
  def show
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:month_id])
  end


  def new
    @year = Year.find(params[:year_id])
    @month = Month.new
  end
  
  def create
    Month.create(month_params)
    redirect_to root_path
  end

  def destroy
    month = Month.find(params[:id])
    month.destroy
    redirect_to root_path
  end

  private
  def month_params
    params.require(:month).permit(:month).merge(user_id: current_user.id, year_id: params[:year_id])
  end
end
