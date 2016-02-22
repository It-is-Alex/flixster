class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_enrollment
  
  def show

  end

  private
  
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def verify_enrollment
    current_course = current_lesson.section.course
    if !current_user && !current_user.enrolled_in?(current_course)
      redirect_to course_path(current_course), alert: 'Your not currently enrolled in this course!'
    end
  end

end
