FactoryGirl.define do
  factory :model do |f|
    f.name 'test-car-model'
    f.association :make, factory: :maker, name: "blablabla", webmotors_id: 10
  end
end