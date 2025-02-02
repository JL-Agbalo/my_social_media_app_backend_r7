class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
    
    has_many :posts
    # , dependent: :destroy
    # Overrides the default as_json method to customize the JSON representation of the User model.
    # Excludes sensitive and unnecessary attributes from the JSON output.
    # 
    # @param options [Hash] a hash of options to customize the JSON output.
    # @return [Hash] a hash representing the User model in JSON format, excluding :password_digest, :created_at, :updated_at, and :username.
    def as_json(options = {})
        super(options.merge({ except: [:password_digest, :created_at, :updated_at, :username] }))
    end
end
