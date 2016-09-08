require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  let(:maker) { FactoryGirl.create(:maker) }

  describe "GET index" do
    it "assigns all makers as @makers" do
      get :index
      expect(assigns(:makers)).to eq([maker])
    end
  end

end
