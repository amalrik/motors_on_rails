require 'rails_helper'

describe Webmotors::UpdateMakers do
  it 'updates the makers table' do
    VCR.use_cassette('successful_makers_update') do
      count = Webmotors::UpdateMakers.new().call()
      expect(count).to eq 178
    end
  end
end