class SessionsController < ApplicationController

  def log_in
    session[:user_id] = 1
    redirect_to root_path
  end

  def log_out
    session[:user_id] = nil
  end

end
