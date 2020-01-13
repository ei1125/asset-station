class YearsController < ApplicationController

  def index #トップページ（ログイン後):２
    @years = Year.where(user_id: current_user.id).includes(:user).order("year DESC")
    @months = Month.where(user_id: current_user.id).includes(:user).order("month ASC")
    
    @last_month_assets = Month.includes(:user).where(user_id: current_user.id).joins(:assets,:year).order("year DESC","month DESC").first
    if @last_month_assets.present?
      @last_assets = @last_month_assets.assets
    end
    @last_month_debts = Month.includes(:user).where(user_id: current_user.id).joins(:debts,:year).order("year DESC","month DESC").first
    if @last_month_debts.present?
      @last_debts = @last_month_debts.debts
    end
  end
  
  def show #月単位のグラフ
    @year = Year.find(params[:id])
    @months = @year.months

    # @months_cf = change_array(@months)
  end

  def chart #年単位のグラフ
    @years = Year.where(user_id: current_user.id).includes(:user)
   
    # def year_array(years)
    #   array = []
    #   years.each do |year|
    #     total_cf = year.incomes.sum(:cf) - year.expenses.sum(:cf)
    #     array << [ year.year, total_cf ]
    #   end
    #   return array
    # end
    # @years_cf = year_array(@years)

  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    if @year.save
      redirect_to new_year_month_path(@year)
    else
      redirect_to root_path
    end
  end

  def destroy
    year = Year.find(params[:id])
    year.destroy
    redirect_to root_path
  end

  private
  def year_params
    params.require(:year).permit(:year).merge(user_id: current_user.id)
  end
end
