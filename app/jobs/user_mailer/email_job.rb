EmailJob = Struct.new(:emails) do
  def perform
    emails.each { |e| UserMailer.deliver_email}
  end

  def queue_name
    'delayed_job_queue'
  end

  def success(job)
  end

  def error(job,exceptions)
  end

  def failure(job)
  end
end
