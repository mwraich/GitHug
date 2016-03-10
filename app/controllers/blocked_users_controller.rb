class BlockedUsersController < ApplicationController

  def create
    @blocked_user = BlockedUser.new(blocked_user_params)
    @blocked_user.user = current_user
    @blocked_user.save
      redirect_to :back
  end

private

def blocked_user_params
  params.require(:blocked_user).permit(:blocked_id)
end


end
