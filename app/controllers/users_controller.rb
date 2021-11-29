class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    following?
    @new_following = Following.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(persona_edit_params)
  end

  private

  def following?
    @following = Following.find_by(user: current_user, followable: @user)
  end

  def persona_edit_params
    params.require(:user).permit(:first_name, :last_name, :description, :email)
  end
end
