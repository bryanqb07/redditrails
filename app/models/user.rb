class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true
    after_initialize :ensure_session_token
    has_secure_password

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username).try(:authenticate, password)
    end

    private 

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
end
