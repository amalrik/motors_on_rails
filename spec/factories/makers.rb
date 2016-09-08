FactoryGirl.define do
  factory :maker, class: Make do |f|
    f.name 'test-car-maker'
    f.webmotors_id 2
  end
end