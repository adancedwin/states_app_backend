# frozen_string_literal: true

class AuthenticationToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
  scope :valid, -> { where('expires_at IS NULL OR expires_at > ?', Time.zone.now) }

  def self.generate!(user)
    create!(token: Devise.friendly_token, user_id: user.id)
  end
end
