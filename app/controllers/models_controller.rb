class ModelsController < ApplicationController
  def index
    @models = Make.where(model_params).take.models
  end

  private
  def model_params
    params.require(:make).permit(:id)
  end
end
