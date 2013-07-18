FactoryGirl.define do
  factory :opt_in do
    sequence(:email) { |n| "some.email#{n}@gmail.com" }
    sequence(:mobile) { |n| "050111111#{n}" }
    sequence(:first_name) { |n| "Firstname#{n}" }
    sequence(:last_name) { |n| "Lastname#{n}" }
    permission_type
    channel
    company
  end

  factory :permission_type do
    sequence(:name) { |n| "permission_type#{n}" }
  end

  factory :channel do
    sequence(:name) { |n| "channel#{n}" }
  end

  factory :company do
    sequence(:name) { |n| "company#{n}" }
  end
end
