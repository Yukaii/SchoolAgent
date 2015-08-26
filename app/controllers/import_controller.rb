class ImportController < ApplicationController
  def index
  end

  def import_course
    courses = Agent.fetch({
      studentno: params[:studentno],
      idcard: params[:idcard],
      birthday: params[:birthday],
      password: params[:password]
    })

    unless courses.blank?
      redirect_to import_result_path
    else
      redirect_to root_path
    end
  end

  def result

  end
end
