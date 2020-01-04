class IncomesController < ApplicationController
  
  def index
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:month_id])
    @years = Year.where(user_id: current_user.id).includes(:user).order("year DESC")
    @months = Month.where(user_id: current_user.id).includes(:user).order("month ASC")
    @incomes = @month.incomes.includes(:user)
    @expenses = @month.expenses.includes(:user)
    
  end

  def create
    income = Income.create(income_params)
    if income_params[:cf].nil?
      redirect_to "/years/#{income.year.id}/months/#{income.month.id}"
    else
      redirect_to "/years/#{income.year.id}/months/#{income.month.id}/incomes"
    end
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy
    redirect_to "/years/#{income.year.id}/months/#{income.month.id}"
  end

  def update
    income = Income.find(params[:id])
    income.update(income_params)
    if income_params[:cf].nil?
      redirect_to "/years/#{income.year.id}/months/#{income.month.id}"
    else
      redirect_to "/years/#{income.year.id}/months/#{income.month.id}/incomes"
    end
  end
  
  private

  def income_params
    params.require(:income).permit(:item,:cf).merge(user_id: current_user.id, month_id: params[:month_id])
  end

end
