class HomeController < ApplicationController

  def index
  end

  def guest
    @gyms = Gym.all
  end

  def about
  end

  def login
  end

end
