class ImportController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def import_course
    @course_codes = Agent.fetch({
      studentno: params[:studentno],
      idcard: params[:idcard],
      birthday: params[:birthday],
      password: params[:password]
    })

    if !@course_codes.blank?
      render :result
    else
      if @course_codes.nil?
        flash[:error] = "發生錯誤，請稍候在重試"
      else
        flash[:warning] = "您沒有選課的資料哦"
      end
      redirect_to root_path
    end
  end

end
