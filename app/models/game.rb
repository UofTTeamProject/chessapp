class Game < ApplicationRecord
  has_many :moves

  belongs_to :user
  has_many :pieces
  after_create :prepopulate_board
  scope :available, -> {where(white_player_id: nil).or(where(black_player_id: nil))}

  def available_player
    if white_player_id 
      User.find(white_player_id)
    else
      User.find(black_player_id)
    end
  end

  def full?
    if white_player_id && black_player_id
      return true
    else
      return false
    end
  end

  def self.find_by_player_id(player_id)
    where(white_player_id: player_id).or(where(black_player_id: player_id))
  end
  
  def prepopulate_board #displays pieces 
    (1..8).each do |x|
      Pawn.create(x_position: 2, y_position: x, game_id:self.id, image_url: 'pawnwhite.png', piece_color: 'white')
      Pawn.create(x_position: 7, y_position: x, game_id:self.id, image_url: 'pawnblack.png', piece_color: 'black')
    end

    Rook.create(x_position: 1, y_position: 1, game_id:self.id, image_url: 'rookwhite.png', piece_color: 'white')
    Rook.create(x_position: 1, y_position: 8, game_id:self.id, image_url: 'rookwhite.png', piece_color: 'white')
    Rook.create(x_position: 8, y_position: 1, game_id:self.id, image_url: 'rookblack.png', piece_color: 'black')
    Rook.create(x_position: 8, y_position: 8, game_id:self.id, image_url: 'rookblack.png', piece_color: 'black')


    Knight.create(x_position: 1, y_position: 2, game_id:self.id, image_url: 'knightwhite.png', piece_color: 'white')
    Knight.create(x_position: 1, y_position: 7, game_id:self.id, image_url: 'knightwhite.png', piece_color: 'white')
    Knight.create(x_position: 8, y_position: 2, game_id:self.id, image_url: 'knightblack.png', piece_color: 'black')
    Knight.create(x_position: 8, y_position: 7, game_id:self.id, image_url: 'knightblack.png', piece_color: 'black')

    Bishop.create(x_position: 1, y_position: 3, game_id:self.id, image_url: 'bishopwhite.png', piece_color: 'white')
    Bishop.create(x_position: 1, y_position: 6, game_id:self.id, image_url: 'bishopwhite.png', piece_color: 'white')
    Bishop.create(x_position: 8, y_position: 3, game_id:self.id, image_url: 'bishopblack.png', piece_color: 'black')
    Bishop.create(x_position: 8, y_position: 6, game_id:self.id, image_url: 'bishopblack.png', piece_color: 'black')

    Queen.create(x_position: 1, y_position: 4, game_id:self.id, image_url: 'queenwhite.png', piece_color: 'white')
    Queen.create(x_position: 8, y_position: 4, game_id:self.id, image_url: 'queenblack.png', piece_color: 'black')

    King.create(x_position: 1, y_position: 5, game_id:self.id, image_url: 'kingwhite.png', piece_color: 'white')
    King.create(x_position: 8, y_position: 5, game_id:self.id, image_url: 'kingblack.png', piece_color: 'black')
  end 

end
