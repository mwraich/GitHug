class PullRequestsController < ApplicationController

def index
  @profile = current_user.profile
  @pull_requests_sent_requests = PullRequest.where(sender: current_user).order(:requestee_id, :created_at)
  @pull_requests_received_requests = PullRequest.where(recipient: current_user).order(:requestor_id, :created_at)
end

def reply
  @pull_request_reply = PullRequest.find(params[:id])
  render partial: "pull_request_reply"
end

def new
  @pull_request = PullRequest.new
end

def create
  @pull_request = PullRequest.new(pull_request_params)
  @pull_request.requestor = current_user.profile
  @pull_request.requestee = Profile.find(params[:id])

  if @pull_request.save
    redirect_to profiles_path, alert: "Message request sent!"
  else
    redirect_to profiles_path, alert: "Sorry there was an error processing your request"
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
