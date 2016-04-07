class ConversationsController < ApplicationController

  def index
    @profiles = Profile.all
    @conversations = Conversation.all
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

  end

private
def check_conversation
  if Conversation.where(params[:sender_id], params[:recipient_id]).present?
    @conversation = Conversation.where(params[:sender_id], params[:recipient_id]).first
  else
    @conversation = Conversation.create!(conversation_params)
  end

end

  def conversation_params
    params.permit(:sender_id, :recipeint_id, message_attributes: [:recipient_id, :message, :read_status, :conversation_id)])
  end

end
