class CoursesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @course = Course.new 
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  def create
    @course = Course.find_by_SLN(params[:course][:SLN])
    @r = Registration.create
    @r.course_id = @course.id
    @r.user_id = current_user.id
    @r.kind = params[:course][:registrations_attributes]["0"][:kind]
    logger.debug params[:course][:registrations_attributes]
    #@r.kind = [:registrations_id][:kind]
    @r.save
    redirect_to(accounts_path)
  end 

end
