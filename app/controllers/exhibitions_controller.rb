class ExhibitionsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @exhibitions = Exhibition.all.includes(:user).order(created_at: :desc)
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = current_user.exhibitions.build(exhibition_params)
    if @exhibition.save
      redirect_to my_exhibition_exhibitions_path, success: "個展を開催しました！"
    else
      flash.now[:danger] = "個展を開くことができませんでした"
      render :new
    end
  end

  def show
    @exhibition = current_user.exhibitions.find(params[:id])
  end

  def my_exhibition
    @my_exhibitions = current_user.exhibitions
  end

  private 
  def exhibition_params
    params.require(:exhibition).permit(:title, :description)
  end
end
