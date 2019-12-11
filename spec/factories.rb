
FactoryBot.define do
  factory :move do
    
  end

  factory :piece do
    x_position {0}
    y_position {0}
  end

  factory :game do
    white_player_id {nil}
    black_player_id {nil}
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end

    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end
end

