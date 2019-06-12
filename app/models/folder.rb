class Folder<ActiveRecord::Base
  belongs_to :user
  has_many  :folders_pieces
  has_many :pieces, through: :folders_pieces
end