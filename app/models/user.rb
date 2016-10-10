class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true

	def self.authenticate(params)
		User.find_by_email(params[:email]).try(:authenticate, params[:password])
	end
end
