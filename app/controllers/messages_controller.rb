class MessagesController < ApplicationController

  def index
    @profile = current_user.profile
    @messages_sent_messages = Message.all.order(created_at: :desc)
    @messages_recipient_messages = Message.all.order(subject_line: :asc, user_id: :asc, created_at: :desc)
    @message = Message.new

    # if @message.update_attributes(message_params)
    #   redirect_to messages_path
    # else
    #   render :new
    # end
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
    @message = Message.find(paramsp[:id])
  end

  def update
    @message = Message.find(paramsp[:id])
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
    params.require(:message).permit(:recipient_id, :message, :subject_line)
  end
end
