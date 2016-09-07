class HomeController < ApplicationController
  def index
    @makers = Make.where.not(name: '').order('name')
  end
end
