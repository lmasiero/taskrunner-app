class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true

	has_many :requests
	has_many :professionals, through: :requests

	def self.authenticate(params)
		User.find_by_email(params[:email]).try(:authenticate, params[:password])
	end
end
