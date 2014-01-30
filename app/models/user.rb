# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
	# attr_accessible not needed in rails 4
	# attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password

	validates :name, presence: true, length: { maximum: 50, too_long: "must be less than %{count} characters" }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6, too_short: "must be at least %{count} characters" }
	validates :password_confirmation, presence: true

	before_save { |user| user.email = email.downcase }
  	before_save :create_remember_token


	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
