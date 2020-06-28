# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @advertisements = Advertisement.includes(:user).limit(12).order(created_at: :desc)
  end
end