module JobsHelper

  def it_my_job_posting?(job)
    current_user && current_user.jobs.include?(job)
  end
end
