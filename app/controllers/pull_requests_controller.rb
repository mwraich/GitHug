class PullRequestsController < ApplicationController

def index
  @profile = current_user.profile
  @pull_requests_sent_requests = PullRequest.where(sender: @profile.id).order(:requestee_id, :created_at)
  @pull_requests_received_requests = PullRequest.where(recipient: @profile.id).order(:requestor_id, :created_at)
end

def edit
  @pull_request_received_requests = PullRequest.find(params[:id])
  # render partial: "pull_request_reply"
end

def new
  @pull_request = PullRequest.new
end

def create
  @pull_request = PullRequest.new(pull_request_params)
  @pull_request.requestor = current_user.profile
  # @pull_request.requestee = Profile.find(params[:id])

  if @pull_request.save
    redirect_to profiles_path, alert: "Message request sent!"
  else
    redirect_to profiles_path, alert: "Sorry there was an error processing your request"
  end
end

def update
  @pull_request = PullRequest.find(params[:id])
  if @pull_request.update_attributes(pull_request_params)
    redirect_to messages_path, notice: "Message request reply successful"
  end
end

def show
  @sent_requests = PullRequest.find(params[:requestor_id])
  @received_requests = PullRequest.find(params[:requestee_id])
end

private
def pull_request_params
  params.require(:pull_request).permit(:requestor_id, :requestee_id, :read, :permission)
end
end
