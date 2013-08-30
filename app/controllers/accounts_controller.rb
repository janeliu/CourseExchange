class AccountsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    @college = @user.college
    @account = Account.find_by_user_id(@user.id)
    logger.debug @account
    if @account.nil?
      @account = Account.create
      @account.user_id = @user.id
    end
    @account.save
    #@user = User.find(params[:id])
    #if @user.account
     # @account = @user.account
    #else
     # @account = Account.create
      #@account.user_id = params[:id]
      #@account.save
  end

  def edit
    @user = current_user
  end

  def show
    @user = current_user
    @wanted_courses = @user.wanted_courses
    @available_courses = @user.available_courses
  end

  def search
    @user = current_user
    @course_id = params[:wanted_id]
    @course = Course.find(@course_id)
    @available_users = @course.available_users
  end

  def remove
    @ids = params[:available_ids]
    unless @ids.nil?
      @ids.each do |avail_id|
        r1 = Registration.find_by_user_id_and_course_id(current_user.id, avail_id.to_i)
        if r1.kind = "available"
          r1.delete
          r1.save
        end
      end
    end

    @ids2 = params[:wanted_ids]
    unless @ids2.nil?
      @ids2.each do |wanted_id|
        r2 = Registration.find_by_user_id_and_course_id(current_user.id, wanted_id.to_i)
        if r2.kind = "wanted"
          r2.delete
          r2.save
        end
      end
    end
    
    redirect_to(accounts_path)
  end

end
