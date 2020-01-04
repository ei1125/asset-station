class MonthsController < ApplicationController
  
  def show
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:id])
    @income = Income.new
    @incomes = @month.incomes.includes(:user)
    @expense = Expense.new
    @expenses = @month.expenses.includes(:user)
  end

  def new
    @year = Year.find(params[:year_id])
    @month = Month.new
  end

  def edit
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:id])
    @income = Income.new
    @incomes = @month.incomes.includes(:user)
    @expense = Expense.new
    @expenses = @month.expenses.includes(:user)
  end
  
  def create
    @year = Year.find(params[:year_id])
    @month = Month.new(month_params)
    if @month.save
      redirect_to year_month_path(@year, @month)
    else
      redirect_to root_path
    end
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
