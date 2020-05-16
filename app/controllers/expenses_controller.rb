class ExpensesController < ApplicationController
  before_action :set_item, only: [:destroy, :update]

  def create
    @year = Year.find(params[:year_id])
    @expense = Expense.new(expense_params)
    @expense.save
      respond_to do |format|
        format.json
        format.html {
          redirect_to "/years/#{@expense.year.id}/months/#{@expense.month.id}"
        }
      end
  end

  def destroy
    @expense.destroy
  end
  
  def update
    @expense.update(expense_params)
    if expense_params[:cf].nil?
      redirect_to "/years/#{@expense.year.id}/months/#{@expense.month.id}"
    else
      redirect_to "/years/#{@expense.year.id}/months/#{@expense.month.id}/money_edit"
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:item,:cf).merge(user_id: current_user.id, month_id: params[:month_id])
  end

  def set_item
    @expense = Expense.find(params[:id])
  end

end
