class ExpensesController < ApplicationController
  
  def create
    expense = Expense.create(expense_params)
    if expense_params[:cf].nil?
      redirect_to "/years/#{expense.year.id}/months/#{expense.month.id}"
    else
      redirect_to "/years/#{expense.year.id}/months/#{expense.month.id}/incomes"
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to "/years/#{expense.year.id}/months/#{expense.month.id}"
  end
  
  def update
    expense = Expense.find(params[:id])
    expense.update(expense_params)
    if expense_params[:cf].nil?
      redirect_to "/years/#{expense.year.id}/months/#{expense.month.id}"
    else
      redirect_to "/years/#{expense.year.id}/months/#{expense.month.id}/incomes"
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:item,:cf).merge(user_id: current_user.id, month_id: params[:month_id])
  end

end
