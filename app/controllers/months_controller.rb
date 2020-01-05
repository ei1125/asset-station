class MonthsController < ApplicationController
  
  def show #ある月の項目追加入力：４
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:id])
    @income = Income.new
    @incomes = @month.incomes.includes(:user)
    @expense = Expense.new
    @expenses = @month.expenses.includes(:user)
    @asset = Asset.new
    @assets = @month.assets.includes(:user)
    @debt = Debt.new
    @debts = @month.debts.includes(:user)
  end

  def new #月を入力ページ：３
    @year = Year.find(params[:year_id])
    @month = Month.new
  end

  def edit #ある月のデータ編集：５
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:id])
    @income = Income.new
    @incomes = @month.incomes.includes(:user)
    @expense = Expense.new
    @expenses = @month.expenses.includes(:user)
    @asset = Asset.new
    @assets = @month.assets.includes(:user)
    @debt = Debt.new
    @debts = @month.debts.includes(:user)
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
