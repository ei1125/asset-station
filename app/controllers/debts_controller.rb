class DebtsController < ApplicationController
  before_action :set_item, only: [:destroy, :update]

  def create
    @year = Year.find(params[:year_id])
    @debt = Debt.new(debt_params)
    @debt.save
      respond_to do |format|
        format.json
        format.html {
          redirect_to "/years/#{@debt.year.id}/months/#{@debt.month.id}"
        }
      end
  end

  def destroy
    @debt.destroy
  end

  def update
    @debt.update(debt_params)
    if debt_params[:money].nil?
      redirect_to "/years/#{@debt.year.id}/months/#{@debt.month.id}"
    else
      redirect_to "/years/#{@debt.year.id}/months/#{@debt.month.id}/money_edit"
    end
  end
  
  private

  def debt_params
    params.require(:debt).permit(:item, :money, :rate).merge(user_id: current_user.id, month_id: params[:month_id])
  end

  def set_item
    @debt = Debt.find(params[:id])
  end

end
