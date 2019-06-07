# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def authors
    @users = User.authors
    @users_count = @users.count
    @users = @users.order(created_at: :desc).offset(
      params[:offset] || 0).limit(params[:limit] || 20
    )
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :image)
  end
end
