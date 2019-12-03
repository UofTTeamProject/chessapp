
FactoryBot.define do
  factory :move do
    
  end

  factory :piece do
    
  end

  factory :game do
    
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end

    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end
end

