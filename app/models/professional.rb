class Professional < ApplicationRecord
  belongs_to :category
	has_secure_password
	validates :email, presence: true, uniqueness: true
end
