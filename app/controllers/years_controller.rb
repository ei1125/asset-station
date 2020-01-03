class YearsController < ApplicationController

  def index
    @years = Year.where(user_id: current_user.id).includes(:user).order("year DESC")
    @months = Month.where(user_id: current_user.id).includes(:user).order("month ASC")
  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    if @year.save
      redirect_to new_year_month_path(@year)
    else
      redirect_to root_path
    end
  end

  def destroy
    year = Year.find(params[:id])
    year.destroy
    redirect_to root_path
  end

  private
  def year_params
    params.require(:year).permit(:year).merge(user_id: current_user.id)
  end
end
