class JobsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @curr_page = 'jobs'
    @all_jobs = Job.all
  end

  def show
    @curr_page = 'jobs'
    @job = Job.find(params[:id])
  end

  def edit
    @curr_page = 'jobs'
    @job = Job.find(params[:id])
  end

  def update
    attributes = params[:job_person] ? params[:job_person] : params[:job_company]
    @job = Job.find(params[:id])
    if current_user.jobs.include?(@job) or current_user.admin?
      if(@job.update_attributes(attributes))
        flash[:notice] = 'Job updated'
        redirect_to job_path(@job)
      else
        flash[:error] = 'Can\'t update job'
        render 'edit'
      end
    else
      flash[:error] = "You haven't rights to do that"
      redirect_to jobs_path
    end
  end

  def new
    @curr_page = 'jobs'
    if (params[:job_type] == 'person')
      @job= JobPerson.new
    elsif(params[:job_type] == 'company')
      @job= JobCompany.new
    else
      flash[:error] = 'Parameters error, try again'
      redirect_to jobs_path
    end
  end

  def job_select
    @curr_page = 'jobs'
  end

  def create
    attributes = params[:job_person] ? params[:job_person] : params[:job_company]
    @job = params[:job_person] ? JobPerson.new(attributes) : JobCompany.new(attributes)
    if(@job.save)
      current_user.jobs << @job
      flash[:notice] = 'Job saved'
      redirect_to jobs_path
    else
      flash[:error] = 'Can\'t save job'
      render 'new'
    end
  end

end
