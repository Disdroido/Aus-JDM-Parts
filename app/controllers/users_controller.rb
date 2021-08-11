class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    # for admin profile
    @admin_search = Listing.ransack(params[:q])
    @pagy, @listings = pagy(@admin_search.result, items: 100)
  end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'You successfully updated your profile.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :username,
      :email
    )
  end
end
