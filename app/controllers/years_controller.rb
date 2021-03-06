class YearsController < ApplicationController
  before_action :set_sub, only: [:index, :show, :chart]
  before_action :set_item, only: [:show, :destroy]

  def index #トップページ（ログイン後):２
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
    @chart_months = @year.months
  end

  def chart #年単位のグラフ
  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    @years = Year.where(user_id: current_user.id).includes(:user)
    if @year.save
      redirect_to new_year_month_path(@year), notice: "#{@year.year}年を作成しました"
    elsif @years.find_by(year: @year.year).present?
      @year = @years.find_by(year: @year.year)
      redirect_to new_year_month_path(@year)
    else
      @year = Year.new
      flash.now[:alert] = "その値は不適切です"
      render action: :new
    end
  end

  def destroy
    @year.destroy
    redirect_to root_path
  end

  private
  def year_params
    params.require(:year).permit(:year).merge(user_id: current_user.id)
  end

  def set_sub
    @years = Year.where(user_id: current_user.id).includes(:user).order("year DESC")
    @months = Month.where(user_id: current_user.id).includes(:user).order("month ASC")
  end

  def set_item
    @year = Year.find(params[:id])
  end
end
