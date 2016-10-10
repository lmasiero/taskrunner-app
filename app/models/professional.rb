class Professional < ApplicationRecord
  belongs_to :category
	has_secure_password
	validates :email, presence: true, uniqueness: true

  def self.authenticate(params)
    Professional.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
  
end
