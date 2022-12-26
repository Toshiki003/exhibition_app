class ExhibitionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @exhibitions = Exhibition.all.includes(:user).order(created_at: :desc)
  end
end
