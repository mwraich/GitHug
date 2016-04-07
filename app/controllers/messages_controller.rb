class MessagesController < ApplicationController

  def index
    @profile = current_user.profile
    @messages_sent_messages = Message.where(sender: current_user.profile.id).order(:recipient_id, created_at: :desc)
    @messages_recipient_messages = Message.where(recipient: current_user.profile.id).order(:sender_id, created_at: :desc)
    @messages = Message.all
    @received_requests = PullRequest.where(requestee_id: current_user)
  end

  def reply
    @message = Message.find(params[:message_id])
    @reply = Message.new(recipient:@message.sender)
    render partial: "reply"
  end


  def new
    @conversation = check_conversation
    @message = @conversation.messages.build(message_params)
  end

  def create

    @conversation = check_conversation

    @message = @conversation.messages.build(message_params)
    @message.sender = current_user.profile
    @profile = current_user.profile
    @conversation = Conversation.where(params[:sender_id], params[:recipient_id])

    if @message.save
      # && @profile.notification_email?
      # UserMailer.delay.user_message_notification(Profile.find(@message.recipient), Profile.find(@message.sender))
      respond_to do |format|
        format.html do
          if request.xhr?
            render messages_url
          else
            redirect_to messages_url
          end
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          format.html do
            render partial:"reply"
          end
          end
        format.js
      end
    end

    # if @message.save && @profile.notification_sms? && @profile.phone_number?
    #    Profile.find(@message.recipient).send_text_message(@message)
    # end

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

  def check_conversation
    if Conversation.where(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.where(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!
    end

  end

  def message_params
    params.require(:message).permit(:recipient_id, :message, :read_status, :conversation_id)
  end
end
