class ContactSharesController < ApplicationController
  # def index
#     user = User.find(params[:user_id])
#     render json: user.contacts_shares
#   end
  
  def create
    share = ContactShare.new(share_params)
    if share.save
      render json: share
    else
      render(
        json: share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end
  
  def destroy
    share = ContactShare.find(params[:id])
    share.delete
    render json: share
  end
    
  
  private
  def share_params
    params.require(:contact_share).permit(:user_id, :contact_id)
  end
  
end
