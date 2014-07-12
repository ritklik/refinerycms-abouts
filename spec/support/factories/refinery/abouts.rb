
FactoryGirl.define do
  factory :about, :class => Refinery::Abouts::About do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

