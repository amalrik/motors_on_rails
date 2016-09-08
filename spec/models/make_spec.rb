require 'rails_helper'

RSpec.describe Make, :type => :model do
  subject(:maker) { FactoryGirl.create(:maker) }
  describe '#update_or_create' do
    it "has a valid factory" do
      expect(maker).to be_valid
    end

    context 'when the maker doesnt exists in the database' do
      it "creates a new make on the database" do
        expect{Make.where(name: "test-make-2").update_or_create(name: "test-make-2", webmotors_id: 3)}.to change(Make,:count).by(1) 
      end
    end

    context 'when the maker already exists in the database' do
      it "updates the existing record" do
        maker.save
        expect{Make.where(name: maker.name).update_or_create(name: maker.name, webmotors_id: maker.webmotors_id)}.to_not change(Make,:count)
      end
    end
  end
end
