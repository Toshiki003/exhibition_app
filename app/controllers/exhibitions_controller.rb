class ExhibitionsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_exhibition, only: %i[edit update destroy]
  
  def index
    @q = Exhibition.ransack(params[:q])
    @exhibitions = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @exhibition = Exhibition.new
  end

  def create
    @exhibition = current_user.exhibitions.build(exhibition_params)
    if @exhibition.save
      redirect_to exhibitions_path, success: "個展を開催しました！"
    else
      flash.now[:danger] = "個展を開くことができませんでした"
      render :new
    end
  end

  def show
    @exhibition = Exhibition.find(params[:id])
    @work = Work.new
    @works = @exhibition.works.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @exhibition.update(exhibition_params)
      redirect_to @exhibition, success: "個展を更新しました"
    else
      flash.now['danger'] = "個展を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @exhibition.destroy!
    redirect_to exhibitions_path, success: "個展を削除しました"
  end

  def my_exhibition
    @q = current_user.exhibitions.ransack(params[:q])
    @my_exhibitions = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def bookmarks
    @bookmarks_exhibitions = current_user.bookmarks_exhibitions.includes(:user).order(created_at: :desc)
  end

  private 
  def exhibition_params
    params.require(:exhibition).permit(:title, :description)
  end

  def set_exhibition
    @exhibition = current_user.exhibitions.find(params[:id])
  end
end
