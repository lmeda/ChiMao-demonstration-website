class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  def add_breadcrumb(label, path = nil)
    @breadcrumbs << {
      label: label,
      path: path
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def is_admin!
    if current_administrator&.admin
    else
      redirect_to root_path
    end
  end
end
