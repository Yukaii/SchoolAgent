class CourseUpdateWorker
  include Sidekiq::Worker

  def perform *args
    CourseAPI.import(args)
  end
end
