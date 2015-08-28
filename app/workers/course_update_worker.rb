class CourseUpdateWorker
  include Sidekiq::Worker

  def perform(course_codes, user_id)
    CourseAPI.import(course_codes: course_codes, user_id: user_id)
  end
end
