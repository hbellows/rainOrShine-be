class Api::V1::SessionsController < ApiController
  before_action :validate_user
  helper_method :user

  def create
    render json: UserSerializer.new(user), status: 200
  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def user
    @user ||= User.find_by_email(session_params[:email])
  end

  def valid_password?
    user.authenticate(session_params[:password])
  end

  def validate_user
    render json: nil, status: 403 unless user && valid_password?
  end
end