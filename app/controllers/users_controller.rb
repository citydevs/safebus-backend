class UsersController < ApplicationController


  def set_reg
    if current_user != nil
      user = User.find(current_user)
      puts params[:reg_id]
      user.reg_id = params[:reg_id]
      if user.save
        render :json => {:msg => "Success!"}
      end
    else 
      render :json => {:error => "login first"}, :status => :not_found
    end
    
  end
end
