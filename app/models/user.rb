class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable

  validates :name, presence: true, format: /\A[^0-9`!@#\$%\^&*+_=]+\z/
  validates :username, presence: true, uniqueness: true, format: /\A[a-z\d]+\z/, length: 1..30

  has_many :recipes, dependent: :destroy

  def author_of?(recipe)
    recipes.include?(recipe)
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
#
