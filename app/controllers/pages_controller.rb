class PagesController < ApplicationController
  layout "main", only: [:home]

  def home
  end

  def about
    add_breadcrumb('About')
  end
end
