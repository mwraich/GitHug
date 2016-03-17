class MessagesController < ApplicationController

  def index
    @profile = current_user.profile
    @messages_sent_messages = Message.where(sender: current_user).order(:recipient_id, :created_at)
    @messages_recipient_messages = Message.where(recipient: current_user).order(:sender_id, :created_at)
    @messages = Message.all
  end

  def reply
    @message = Message.find(params[:message_id])
    @reply = Message.new(recipient:@message.sender, subject_line:"RE: #{@message.subject_line}")
    render partial: "reply"
  end

  def new
    @message = Message.new
  end

  def create
    @profile = Profile.find(params[:id])
    @message = Message.new(message_params)
    @message.sender = current_user.profile

    if @message.save && @profile.notification_email?
      UserMailer.user_message_notification(Profile.find(@message.recipient)).deliver_later
      redirect_to messages_path, notice: "Message sent!"
    else
      redirect_to messages_url, alert: "SORRY THERE WAS AN ERROR!"
    end

    if @message.save && @profile.notification_email? && @profile.phone_number.any?
        send_text_message
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
    params.require(:message).permit(:recipient_id, :message, :subject_line, :read_status)
  end
end
