class WorksController < ApplicationController
    def create
        work = current_user.works.build(work_params)
        if work.save
            redirect_to exhibition_path(params[:exhibition_id]), success: "作品を投稿しました"
        else
            redirect_to exhibition_path(params[:exhibition_id]), danger: "作品を投稿できませんでした"
        end
    end


    private
    def work_params
        params.require(:work).permit(:title, :body, :work_image, :work_image_cache).merge(exhibition_id: params[:exhibition_id])
    end
end
