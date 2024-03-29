class User < ApplicationRecord
  def self.devise_plugins
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    plugins = %i[database_authenticatable recoverable registerable rememberable validatable]

    plugins << :masqueradable if ENV['IMPERSONATE'] == 'true'

    plugins
  end

  devise(*devise_plugins)

  validates :name, presence: true, length: 1..50, format: /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :username, presence: true,
                       uniqueness: true,
                       length: 1..15,
                       format: { with: /\A[a-z0-9]+(?:[_][a-z0-9]+)*\z/, message: :invalid }
  validates :bio, length: 0..160, allow_blank: true

  has_many :recipes, -> { alphabetize }, dependent: :destroy
  has_many :collections, -> { alphabetize }, dependent: :destroy
  has_one_attached :photo

  def author_of?(recipe)
    recipes.include?(recipe)
  end

  def owner_of?(collection)
    collections.include?(collection)
  end

  def admin=(value)
    if value
      self.admin_since = Time.current
    else
      self.admin_since = nil
    end
  end

  def admin?
    !!admin_since
  end

  private

  private_class_method :devise_plugins
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  name                   :string
#  admin_since            :datetime
#  bio                    :text
#  website                :string
#  photo                  :string
#
