class WelcomeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:hello]

  def hello
    #unauthenticated
  end

  def dashboard
    #show admin dashboard
    
  end

  def status
  end

  def configuration
  end

  def home
  end
end
