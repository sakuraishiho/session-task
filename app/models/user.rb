# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
    validates :name, presence: { message: 'を入力してください' }
    validates :email, presence: { message: 'を入力してください' }, uniqueness: { message: 'はすでに使用されています' }
    validates :password, presence: { message: 'を入力してください' }, length: { minimum: 6, message: 'は6文字以上で入力してください' }
    validate :passwords_match
  
    private
  
    def passwords_match
      if password != password_confirmation
        errors.add(:password_confirmation, 'とパスワードの入力が一致しません')
      end
    end
end
