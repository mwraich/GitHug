class ConversationsController < ApplicationController

  def index
    @profiles = Profile.all
    @conversations = Conversation.all
  end

  def create
    @message = Conversation.messages.build

    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

private

  def conversation_params
    params.permit(:sender_id, :recipeint_id, message_attributes: [:recipient_id, :message, :read_status, :conversation_id)])
  end

end
