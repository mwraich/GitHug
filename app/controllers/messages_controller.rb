class MessagesController < ApplicationController

  def index
    @profile = current_user.profile
    @messages = Message.all.order(created_at: :desc)
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    # @profile = Profile.find(params[:id])
    @message = Message.new(message_params)
    @message.sender = current_user.profile

    if @message.save
      UserMailer.user_message_notification(Profile.find(@message.recipient)).deliver_later
      redirect_to messages_path, notice: "Message sent!"
    else
      render :new
    end

  end

  def show
    @profile = Profile.find(params[:id])
    @messge = Message.find(params[:id])
  end

  # def inbox
  #   @profile = Profile.find(params[:id])
  #   @messge = Message.find(params[:id])
  # end
  #
  # def sent
  #   @profile = Profile.find(params[:id])
  #   @messge = Message.find(params[:id])
  # end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:recipient_id, :message, :subject_line)
  end
end
