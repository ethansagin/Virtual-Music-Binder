class Piece<ActiveRecord::Base
  has_many :folders_pieces
  belongs_to :user
  has_many :folders, through: :folders_pieces
end