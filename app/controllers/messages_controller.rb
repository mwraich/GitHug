class MessagesController < ApplicationController

  def index
    @profile = current_user.profile
    @messages_sent_messages = Message.where(sender: current_user.profile.id).order(:recipient_id, created_at: :desc)
    @messages_recipient_messages = Message.where(recipient: current_user.profile.id).order(:sender_id, created_at: :desc)
    @messages = Message.all
  end

  def reply
    @message = Message.find(params[:message_id])
    @reply = Message.new(recipient:@message.sender)
    render partial: "reply"
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
      redirect_to messages_url, alert: "SORRY THERE WAS AN ERROR!"
    end

  end

  def show
    @profile = Profile.find(params[:id])
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to messages_path
    else
      render :new
    end
  end


  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:recipient_id, :message, :read_status)
  end
end
