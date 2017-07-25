class HomeController < ApplicationController
  skip_before_action :current_user

  def home
  end

  private

end
