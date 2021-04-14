class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true

    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    enum role: [:patient, :therapist, :admin]

    has_many :messages
end
