class AdvertisementsController < ApplicationController

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'advertisement was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def advertisement_params
      params.require(:advertisement).permit(:category, :advert_type, :model, :price, :location, :user_id)
    end
end





