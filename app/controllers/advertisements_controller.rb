class AdvertisementsController < ApplicationController
  before_action :authenticate_user!, :set_advert, only: [:show]
  def show
  end
  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html do
          redirect_to @advertisement, notice: 'advertisement was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  private
    def advertisement_params
      params.require(:advertisement).permit(:category, :advert_type, :model,
                                            :price, :location, :user_id)
    end
    def set_advert
      @advertisement = Advertisement.find(params[:id])
    end
end





