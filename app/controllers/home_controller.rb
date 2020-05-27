# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @advertisements = Advertisement.all.take(50)
  end
end