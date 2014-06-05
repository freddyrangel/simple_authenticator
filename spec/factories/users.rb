FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "#{n}test@example.com" }
    password              "foobarbaz"
    password_confirmation "foobarbaz"
  end
end
