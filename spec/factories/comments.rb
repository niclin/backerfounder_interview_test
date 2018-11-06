FactoryGirl.define do
  factory :comment do
    body "MyText"
    user_id 1
    parent_id 1
  end
end
