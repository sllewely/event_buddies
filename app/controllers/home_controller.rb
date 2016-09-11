class HomeController < ApplicationController
  skip_before_filter :current_user

  def home
  end

  private

end
