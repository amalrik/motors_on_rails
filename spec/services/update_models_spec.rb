require 'rails_helper'

describe Webmotors::UpdateModels do
  chevrolet = FactoryGirl.create(:maker)
  #let (:chevrolet_id) { chevrolet.id }
  VCR.use_cassette('successful_models_update') do
    count = Webmotors::UpdateModels.new([chevrolet.id]).call()
    it 'updates the models table' do
      expect(count).to eq 93
    end
  end
end