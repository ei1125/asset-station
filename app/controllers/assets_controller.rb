class AssetsController < ApplicationController

  def index #ある月の金額入力：６
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:month_id])
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
    @asset = Asset.new(asset_params)
    @asset.save
      respond_to do |format|
        format.json
        format.html {
          if income_params[:cf].nil?
            redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}"
          else
            redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}/incomes"
          end
        }
      end

    # asset = Asset.create(asset_params)
    # if asset_params[:money].nil?
    #   redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}"
    # else
    #   redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}/incomes"
    # end
  end

  def destroy
    asset = Asset.find(params[:id])
    asset.destroy
    # redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}"
  end

  def update
    asset = Asset.find(params[:id])
    asset.update(asset_params)
    if asset_params[:money].nil?
      redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}"
    else
      redirect_to "/years/#{asset.year.id}/months/#{asset.month.id}/assets"
    end
  end
  
  private

  def asset_params
    params.require(:asset).permit(:item, :money, :deposit).merge(user_id: current_user.id, month_id: params[:month_id])
  end



end
