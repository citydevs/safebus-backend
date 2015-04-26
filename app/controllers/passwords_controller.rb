class UsersController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      @password = Password.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def password_params
      params.require(:password).permit(:password)
    end
end