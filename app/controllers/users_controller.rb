class UsersController < ApplicationController
  def index
    if user_signed_in?
      @years = Year.where(user_id: current_user.id).includes(:user).order("year DESC")
      @months = Month.where(user_id: current_user.id).includes(:user).order("month ASC")
      render template: 'years/index'
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
