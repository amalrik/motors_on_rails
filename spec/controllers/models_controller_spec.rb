require 'rails_helper'

RSpec.describe ModelsController, :type => :controller do
  let(:model) { FactoryGirl.create(:model) }

  describe "GET index" do
    it "assigns all makers as @makers" do
      get :index, {make: {id: model.make.id }}
      expect(assigns(:models)).to eq([model])
    end
  end

end
