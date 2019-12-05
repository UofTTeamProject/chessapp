class Game < ApplicationRecord
  scope :available, -> {where(white_player_id: nil).or(where(black_player_id: nil))}

  def available_player
    if white_player_id 
      User.find(white_player_id)
    else
      User.find(black_player_id)
    end
  end
end
