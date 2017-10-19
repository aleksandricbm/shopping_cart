FactoryGirl.define do
  factory :user, class: 'User' do
    email 'test@example.com'
    password 'aq4Awsedvgty'

    trait :with_order do
      after(:create) do |user|
        create_list :with_all_data, 1, user_id: user.id
      end
    end
  end
end
