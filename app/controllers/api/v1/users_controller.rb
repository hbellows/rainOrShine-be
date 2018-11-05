class Api::V1::UsersController < ApiController
  before_action :new_user

  def create
    render json: UserSerializer.new(new_user).serialized_json, status: 201    
  end

  private
    def new_user
      @new_user ||= User.create(user_params)
    end

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end