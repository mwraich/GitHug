ImageJob = Struct.new(:images) do
  def perform
    images.each { |e| ImageUploader.deliver_email}
    image.process!
  end

  def queue_name
    'image_job_queue'
  end

  def success(job)
    update_status('success')
  end

  def error(job,exceptions)
    update_status('temp_error')
    #send email notification/alert
  end

  def failure(job)
    update_status('failure')
  end

  private
  def update_status(status)
    image = ImageUploader::Image.find
    email.status = status
  end
end
