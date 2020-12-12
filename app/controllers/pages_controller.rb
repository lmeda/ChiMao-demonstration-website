class PagesController < ApplicationController
  layout "main", only: [:home]

  def home
  end

  def about
  end
end
