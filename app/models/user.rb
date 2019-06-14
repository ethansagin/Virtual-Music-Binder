class User<ActiveRecord::Base
  has_many :folders
  has_many :pieces
  has_secure_password
end