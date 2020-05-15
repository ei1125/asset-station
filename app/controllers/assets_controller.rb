class AssetsController < ApplicationController
  before_action :set_item, only: [:destroy, :update]

  def create
    @year = Year.find(params[:year_id])
    @asset = Asset.new(asset_params)
    @asset.save
      respond_to do |format|
        format.json
        format.html {
          redirect_to "/years/#{@asset.year.id}/months/#{@asset.month.id}"
        }
      end
  end

  def destroy
    @asset.destroy
  end

  def update
    @asset.update(asset_params)
    if asset_params[:money].nil?
      redirect_to "/years/#{@asset.year.id}/months/#{@asset.month.id}"
    else
      redirect_to "/years/#{@asset.year.id}/months/#{@asset.month.id}/money_edit"
    end
  end
  
  private

  def asset_params
    params.require(:asset).permit(:item, :money, :deposit).merge(user_id: current_user.id, month_id: params[:month_id])
  end
  
  def set_item
    @asset = Asset.find(params[:id])
  end


end
