class AthleteController < ApplicationController
  before_action :authenticate_athlete!

  def home
  end

  def profile
  end

  def my_gyms
    @gyms = current_athlete.gyms
  end

  def my_courses
    @courses = current_athlete.courses
  end

  def my_coupons
    @coupons = current_athlete.coupons
  end

  def my_worksheets
    @worksheets = current_athlete.worksheets
  end

end
