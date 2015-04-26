class PasswordsController < ApplicationController
  before_action :set_password, only: [:show]
  before_filter :authenticate_user!

  def create
    @password = Password.new(password_params)
    respond_to do |format|
      if @password.save
        format.html { redirect_to @password, notice: 'Password was successfully created.' }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :root }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      @password = Password.last
      @new_password = Password.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def password_params
      params.require(:password).permit(:password)
    end
end