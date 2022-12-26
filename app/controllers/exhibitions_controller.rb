class ExhibitionsController < ApplicationController
  def index
    @exhibitions = Exhibition.all.includes(:user).order(created_at: :desc)
  end
end
