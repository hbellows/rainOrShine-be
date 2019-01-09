class Api::V1::UsersController < ApiController
  before_action :validate_creation
  helper_method :new_user, :save_user

  def create
    render json: UserSerializer.new(new_user), status: 201
  end

  private

  def new_user
    @new_user ||= User.new(user_params)
  end

  def save_user
    new_user.save
  end

  def validate_creation
    render json: { message: 'Unable to register new user.', status: 403} unless save_user
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
