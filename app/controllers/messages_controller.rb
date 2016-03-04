class MessagesController < ApplicationController

  def index
  end

  def new
    @message = Message.new
  end

  def create
    @message = @Profile.message.build(message_params)

    if @message.save
      redirect_to profile_path(@profile), notice: "Message sent!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:recipient, :sender, :message)
  end

  def load_recipient
    @recipient = Profile.find(params[:id])
  end

end
