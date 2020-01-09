class DebtsController < ApplicationController

  def create
    @year = Year.find(params[:year_id])
    @debt = Debt.new(debt_params)
    @debt.save
      respond_to do |format|
        format.json
        format.html {
          if debt_params[:cf].nil?
            redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}"
          else
            redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}/incomes"
          end
        }
      end

    # debt = Debt.create(debt_params)
    # if debt_params[:money].nil?
    #   redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}"
    # else
    #   redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}/incomes"
    # end
  end

  def destroy
    debt = Debt.find(params[:id])
    debt.destroy
    # redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}"
  end

  def update
    debt = Debt.find(params[:id])
    debt.update(debt_params)
    if debt_params[:money].nil?
      redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}"
    else
      redirect_to "/years/#{debt.year.id}/months/#{debt.month.id}/assets"
    end
  end
  
  private

  def debt_params
    params.require(:debt).permit(:item, :money, :rate).merge(user_id: current_user.id, month_id: params[:month_id])
  end

end
