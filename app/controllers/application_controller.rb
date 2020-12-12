class ApplicationController < ActionController::Base
  def is_admin!
    if current_administrator&.admin
    else
      redirect_to root_path
    end
  end
end
