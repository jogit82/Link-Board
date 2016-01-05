class User < ActiveRecord::Base

	validates :email,
	format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
	presence: true,
	uniqueness: true

	validates :name,
	presence: true,
	length: { maximum: 20 }

	validates_presence_of :password, on: :create

	has_secure_password

	has_many :post

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
