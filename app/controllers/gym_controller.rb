class GymController < ApplicationController
  before_action :authenticate_gym!

  def home
  end

  def profile
  end

  def my_courses
    @courses = current_gym.courses
  end

  def my_coupons
    @coupons = current_gym.coupons
  end

  def my_worksheets
    @worksheets = current_gym.worksheets
  end

end
