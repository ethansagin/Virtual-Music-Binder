class Piece<ActiveRecord::Base
  has_many :folders_pieces
  has_many :folders, through: :folders_pieces
end