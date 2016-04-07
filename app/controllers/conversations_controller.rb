class ConversationsController < ApplicationController

  def create
    if Conversation.beteen(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.beteen(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

private

  def conversation_params
    params.permit(:sender_id, :recipeint_id)
  end
  
end
