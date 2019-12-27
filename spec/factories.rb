
FactoryBot.define do
  factory :king, class: "King" do
    
  end

  factory :queen do
    
  end

  factory :rook, class: "Rook" do
    
  end

  factory :bishop do
    
  end

  factory :knight, class: "Knight" do
    
  end

  factory :pawn do
    
  end

  factory :move do
    
  end

  factory :piece do
    game 
    piece_color {"white"}
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

