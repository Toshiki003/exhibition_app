class WorksController < ApplicationController
    def create
        work = current_user.works.build(work_params)
        if work.save
            redirect_to my_exhibition_exhibitions_path, success: "作品を投稿しました"
        else
            flash.now[:danger] = "作品を投稿できませんでした"
            render :new
        end
    end


    private
    def work_params
        params.require(:work).permit(:title, :work_image, :body).merge(exhibition_id: params[:exhibition_id])
    end
end
