class IncomesController < ApplicationController
  before_action :set_item, only: [:destroy, :update]

  def create
    @year = Year.find(params[:year_id])
    @income = Income.new(income_params)
    @income.save
      respond_to do |format|
        format.json
        format.html {
          redirect_to "/years/#{@income.year.id}/months/#{@income.month.id}"
        }
      end
  end

  def destroy
    @income.destroy
  end

  def update
    @income.update(income_params)
    if income_params[:cf].nil?
      redirect_to "/years/#{@income.year.id}/months/#{@income.month.id}"
    else
      redirect_to "/years/#{@income.year.id}/months/#{@income.month.id}/money_edit"
    end
  end
  
  private

  def income_params
    params.require(:income).permit(:item,:cf).merge(user_id: current_user.id, month_id: params[:month_id])
  end
  
  def set_item
    @income = Income.find(params[:id])
  end

end
