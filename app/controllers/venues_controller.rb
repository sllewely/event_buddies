class VenuesController < ApplicationController

  before_filter :has_create_permission, only: [:new, :create]

  def new
  end

  def index
  end

  def create
  end

  private

  def has_create_permission
    @user.is_a_king?
  end

end
