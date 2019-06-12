class User<ActiveRecord::Base
  has_many :folders
  has_secure_password
end