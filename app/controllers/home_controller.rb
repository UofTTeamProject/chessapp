# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @games = Game.available
  end

end
