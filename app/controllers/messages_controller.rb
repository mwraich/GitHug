class MessagesController < ApplicationController

  def index
  end

  def new
    @message = Message.new
  end

  def create
    # @profile = Profile.find(params[:id])
    @message = Message.new(message_params)

    @message.sender = current_user.profile

    if @message.save
      redirect_to profile_path(@message.recipient), notice: "Message sent!"
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @messge = Message.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:recipient_id, :message)
  end
end
