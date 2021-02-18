class PagesController < ApplicationController
  layout "page"

  def home
    render :layout => "main"
  end

  def about
    add_breadcrumb('About')
  end

  def products
    add_breadcrumb('Product')
  end
end
