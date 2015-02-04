require 'user_management'

class SessionsController < ApplicationController
  def new
  end
  def create
    res = Bridge::UserManagement.new.login(params[:email], params[:password])
    #do my stuff
  end
end
