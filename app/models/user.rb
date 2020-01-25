# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['lower(username) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
end
