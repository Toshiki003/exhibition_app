class ExhibitionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @exhibitions = Exhibition.all.includes(:user).order(created_at: :desc)
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to my_exhibition_exhibitions_path, success: "個展を開催しました！"
    else
      render :new
    end
  end

  def my_exhibition
    @my_exhibitions = current_user.exhibitions
  end

  private 
  def exhibition_params
    params.require(:exhibition).permit(:title, :description)
  end
end
