class Professional < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :services
	has_secure_password
	validates :email, presence: true, uniqueness: true

  has_many :requests
  has_many :users, through: :requests

  def self.authenticate(params)
    Professional.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

end
