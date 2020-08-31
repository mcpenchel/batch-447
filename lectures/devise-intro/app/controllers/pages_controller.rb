class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def financial
    @profit = [100000, 2190000, 55555]
  end

end
