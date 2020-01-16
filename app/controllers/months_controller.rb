class MonthsController < ApplicationController
  
  def show #ある月の項目追加入力：４
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:id])
    @income = Income.new
    @incomes = @month.incomes.includes(:user).order("item DESC")
    @expense = Expense.new
    @expenses = @month.expenses.includes(:user).order("item DESC")
    @asset = Asset.new
    @assets = @month.assets.includes(:user).order("item DESC")
    @debt = Debt.new
    @debts = @month.debts.includes(:user).order("item DESC")
  end

  def new #月を入力ページ：３
    @year = Year.find(params[:year_id])
    @month = Month.new
  end

  def edit #ある月のデータ編集：５
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:id])
    @income = Income.new
    @incomes = @month.incomes.includes(:user).order("item DESC")
    @expense = Expense.new
    @expenses = @month.expenses.includes(:user).order("item DESC")
    @asset = Asset.new
    @assets = @month.assets.includes(:user).order("item DESC")
    @debt = Debt.new
    @debts = @month.debts.includes(:user).order("item DESC")
  end
  
  def create
    @year = Year.find(params[:year_id])
    @month = Month.new(month_params)
    if @month.save
      redirect_to year_month_path(@year, @month), notice: "#{@month.month}月を作成しました"
    else
      @year = Year.find(params[:year_id])
      @month = Month.new
      flash.now[:alert] = "その月はすでに登録済みか値が不適切です"
      render action: :new
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
