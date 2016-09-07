class HomeController < ApplicationController
  def index
    @makers = Make.all.order('name')
  end
end
