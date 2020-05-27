# frozen_string_literal: true
class AdvertisementsController < ApplicationController
  before_action :authenticate_user!, :set_advert, only: [:show, :destroy, :update, :edit]
  def index
    @advertisetments = Advertisement.all.where(user_id: current_user.id)
  end

  def show
  end
  def new
    @advertisement = Advertisement.new
  end
  def edit
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
  def update
    respond_to do |format|
      if @high_score.update(high_score_params)
        format.html { redirect_to @advertisement, notice: 'advert was successfully updated'}
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: 'advert was successfully deleted.' }
    end

  end

  private
  def advertisement_params
    params.require(:advertisement).permit(:category, :advert_type, :model,
                                          :price, :location, :user_id,
                                          images: [])
  end
  def set_advert
    @advertisement = Advertisement.find(params[:id])
  end
end





