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

    unless @course_codes.nil?
      render :result
    else
      redirect_to root_path
    end
  end

end
