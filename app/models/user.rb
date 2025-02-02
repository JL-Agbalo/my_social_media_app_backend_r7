class User < ApplicationRecord
    has_secure_password
    
    # Validations
    validates :username, presence: true, length: { minimum: 3 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, length: { minimum: 8 }, format: { 
      with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}\z/,
      message: "must contain at least one uppercase letter, one lowercase letter, one number, and one special character"
    }, if: :password_digest_changed?
    
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
