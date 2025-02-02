class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
        render json: { user: user, message: "User created successfully" }, status: :created
        else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
        render json: { user: user, message: "Login successful" }, status: :ok
        else
        render json: { error: "Invalid email or password" }, status: :unauthorized
        end
    end

    def index
        render json: { users: User.all.map(&:as_json) }
    end
    
    private
    
    def user_params
        params.permit(:username, :email, :password, :bio, :profile_picture, :first_name, :last_name)    
    end  
end
