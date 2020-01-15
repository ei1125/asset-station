class Api::InexesController < ApplicationController
  def index
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:month_id])
    @incomes = @month.incomes.includes(:user).order("item DESC")
    @expenses = @month.expenses.includes(:user).order("item DESC")
    
  end
end