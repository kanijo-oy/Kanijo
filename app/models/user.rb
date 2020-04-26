class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :log_entries

  attribute :accept_tos, :string
  validate :check_tos, on: :create

  has_many :places

  def check_tos
    if accept_tos == '1'
      self.tos_accepted = Time.now
      return
    end

    errors.add(:base, I18n.t(:tos_not_accepted))
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(email: data['email'],
                         password: Devise.friendly_token[0, 20],
                         provider: :google
                        )
    end
    user.provider = :google
    user.save
    user
  end
end
