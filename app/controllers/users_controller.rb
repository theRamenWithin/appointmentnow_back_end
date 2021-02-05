class UsersController < ApplicationController

  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      if current_user.id = @user.id
        @address = @user.address
        render json: { 
          user: @user,
          address: @address
          }
      else
        render json: {
          user: @user
        }
      end
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: 200,
        created: true,
        user: @user
      }
      @address = Address.new(
        address_line_1: nil,
        address_line_2: nil,
        city: nil,
        state: nil,
        country: nil,
        postcode: nil,
        user_id: @user.id,
        organization_id: nil
      )
      @address.save
    else 
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  def update
    if @user.update(user_params)
      render json: {
      status: 200,
      user: @user
      }
    else 
      render json: {
      status: 500,
      errors: @user.errors.full_messages
      }
    end
  end

  def destroy
    @user.destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end


  private
    
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end