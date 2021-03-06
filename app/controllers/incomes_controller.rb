class IncomesController < ApplicationController
  before_action :set_item, only: [:destroy, :update]
  
  #トップページ（データあり）
  def index
    @year = Year.find(params[:year_id])
    @month = Month.find(params[:month_id])
    @years = Year.where(user_id: current_user.id).includes(:user).order("year DESC")
    @months = Month.where(user_id: current_user.id).includes(:user).order("month ASC")
    @incomes = @month.incomes.includes(:user).order("item DESC")
    @expenses = @month.expenses.includes(:user).order("item DESC")

    @last_month_assets = Month.includes(:user).where(user_id: current_user.id).joins(:assets,:year).order("year DESC","month DESC").first
    if @last_month_assets.present?
      @last_assets = @last_month_assets.assets
    end
    @last_month_debts = Month.includes(:user).where(user_id: current_user.id).joins(:debts,:year).order("year DESC","month DESC").first
    if @last_month_debts.present?
      @last_debts = @last_month_debts.debts
    end

  end

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
